package com.mooc.meetingfilm.film.swagger;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.PathSelectors;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@EnableSwagger2
@Configuration
public class SwaggerConfig {
    private ApiInfo apiInfo() {
        return new ApiInfoBuilder().title("springcloud最佳实践")
                .description("SpringCloud集成Swagger")
                .termsOfServiceUrl("")
                .contact("dongyue")
                .license("dongyue")
                .licenseUrl("#").version("1.0").build();
    }
    @Bean
    public Docket newsApi() {
        Docket docket = new Docket(DocumentationType.SWAGGER_2);
        docket.enable(true);
        docket.apiInfo(apiInfo())
                .select()
                //接口扫描的路径
                .apis(RequestHandlerSelectors.basePackage("com.mooc.meetingfilm.film"))
                .paths(PathSelectors.any()).build();
        return docket;
    }
}
