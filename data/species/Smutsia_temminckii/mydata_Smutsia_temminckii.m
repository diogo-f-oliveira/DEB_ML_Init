function [data, auxData, metaData, txtData, weights] = mydata_Smutsia_temminckii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Pholidota'; 
metaData.family     = 'Manidae';
metaData.species    = 'Smutsia_temminckii'; 
metaData.species_en = 'Ground pangolin'; 

metaData.ecoCode.climate = {'Aw', 'BWh', 'BSh', 'Cwa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33.4); % K, body temp
metaData.data_0     = {'am','tg','tx','tp','Wwb','Wwp','Wwi','Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2021 12 15];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, FRAM center, Tromso'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2021 12 15]; 

%% set data
% zero-variate data

data.tg = mean([105,140]);     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'PietJans2020';   
  temp.tg = metaData.T_typical;  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Gestation period is 105-140 d';
data.tx = 3*30.5; units.tx = 'd';    label.tx = 'age at weaning'; bibkey.tx = 'ADW';   
  temp.tx = C2K(33.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'PietJans2020';
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'males and females might be roaming around for some years before actually reproducing.';
data.am = 25*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'PietJans2020';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'authors guess 20-30 years, there is no data.';
  
data.Wwb = 340;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PietJans2020';
comment.Wwb = '15 cm long'; 
data.Wwp = 8e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'SvarRich1999';
comment.Wwp = 'individuals less than 8 kg regarded as sub-adults'; 
data.Wwi = 16.1e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'PietJans2020';
  comment.Wwi = 'maximum weight of males from table 1.1';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'PietJans2020';   
  temp.Ri = C2K(33.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = ['Females possibly give birth only every second year. Twins have been recorded.', ...
'Females may become pregnant while nursing current young.'];
  
% univariate data
% time-weight
data.LWw = [ ... % total body lenth (cm), female body weight (g)
    58.7        3e3;
    82          5.5e3;
    85.1        6.5e3;
    85.8        6.4e3;
    97.1        11.3e3;
    102.3       11.9e3;
    112.1       12.2e3;
    123         12e3;
    127.8       15.8e3;
    140.3       15.5e3];
units.LWw = {'cm', 'g'};  label.LWw = {'total body lenth', 'wet weight'};  
bibkey.LWw = 'HeatCoul1998';

%% facts
F1 = 'males tend to be bigger, sexual dimorphism is not confirmed';
metaData.bibkey.F1 = 'PietJans2020'; 
F2 = 'A free-ranging adult female remotely monitored over 34 days in the Kalahari';
metaData.bibkey.F2 = 'PietJans2020'; 
F3 = 'region of South Africa during winter had a body temperature averaging 32-35degC (min-max,29.5-35.4degC)';
metaData.bibkey.F3 = 'PietJans2020'; 
F4 = 'unclear if they are monogamous or polyandrous';
metaData.bibkey.F4 = 'PietJans2020'; 
F5 = 'predominantly nocturnal';
metaData.bibkey.F5 = 'PietJans2020'; 
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4, 'F5',F5);
   
%% set weights for all real data
weights = setweights(data, []);
% weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '7VRVF'; % Cat of Life
metaData.links.id_ITIS = '584932'; % ITIS
metaData.links.id_EoL = '337648'; % Ency of Life
metaData.links.id_Wiki = 'Smutsia_temminckii'; % Wikipedia
metaData.links.id_ADW = 'Manis_temminckii'; % ADW
metaData.links.id_Taxo = '93405'; % Taxonomicon
metaData.links.id_MSW3 = '13900017'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Smutsia_temminckii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PietJans2020'; type = 'Incollection'; bib = [ ... 
'author = {Darren W. Pietersen1 and Raymond Jansen and Jonathan Swart and Wendy Panaino and Antoinette Kotze and Paul Rankin and Bruno Nebe}, ' ... 
'doi = {10.1016/B978-0-12-815507-3.00011-3}, ' ...
'year = {2020}, ' ...
'title = {{T}emminck''s pangolin \emph{Smutsia temminckii} ({S}muts, 1832)}, ' ...
'booktitle = {Pangolins: Science, Society and Conservation}, ' ...
'pages = {175--193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SvarRich1999'; type = 'Article'; bib = [ ... 
'author = {J. M. Swart and P. R. K. Richardson and J. W. H. Ferguson}, ' ... 
'journal = {J. Zool., Lond.}, ' ...
'year = {1999}, ' ...
'volume = {247}, ' ...
'title = {Ecological factors affecting the feeding behaviour of pangolins (\emph{Manis temminckii})}, ' ...
'pages = {281-292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HeatCoul1998'; type = 'Article'; bib = [ ... 
'author = {Heath, Martha and Coulson, Ian}, ' ... 
'journal = {African Journal of Ecology}, ' ...
'year = {1998}, ' ...
'volume = {36}, ' ...
'number = {3}, ' ...
'doi = {10.1046/j.1365-2028.1998.00129.x}, ' ...
'title = {Notes and Records}, ' ...
'pages = {267-270}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Manis_temminckii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

