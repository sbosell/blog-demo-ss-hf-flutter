using ServiceStack.Text;
using System;
using System.Collections.Generic;
using System.Text;

namespace BlogDemo.ServiceInterface
{
    public static class GhostJsConfig
    {
        public static JsConfigScope With()
        {
            return JsConfig.With(new ServiceStack.Text.Config
            {
                TextCase = TextCase.SnakeCase,
                PropertyConvention = PropertyConvention.Lenient
            });
        }
    }
}
