function [data, auxData, metaData, txtData, weights] = mydata_Bolitoglossa_subpalmata

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Bolitoglossa_subpalmata'; 
metaData.species_en = 'La Palma salamander'; 

metaData.ecoCode.climate = {'Am', 'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'jiTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 28]; 

%% set data
% zero-variate data

data.ab = 4.5*30.5;        units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(8.8); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temperature based on Houc1982';
data.tp = 3*365;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'Houc1982';   
  temp.tp = C2K(10);   units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.tpm = 1.5*365;     units.tpm = 'd';    label.tpm = 'time since birth at puberty for males'; bibkey.tpm = 'Houc1982';   
  temp.tpm = C2K(10);   units.temp.tpm = 'K'; label.temp.tpm = 'temperature'; 
data.am = 35*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(10);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.95;       units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'amphibiaweb';
  comment.Lb = 'based on Bolitoglossa_mexicana';
data.Lp  = 4.5;        units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'Houc1982'; 
data.Lpm  = 3.1;       units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'Houc1982'; 
data.Li  = 7.5;         units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Houc1982';

data.Wwb = 0.05;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on Bolitoglossa_mexicana';
data.Wwi = 33;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Bolitoglossa_mexicana: (7.5/10)^3*78.2';

data.Ri  = 50/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(10);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Bolitoglossa_mexicana: 26 to 40 eggs per clutch, 2 clutches each yr';

% univariate data
% time-length
data.LdL = [ ... % time SVL (cm), change in SVL (cm/yr)
2.596	1.128
2.647	1.427
2.791	1.148
2.801	0.949
2.904	1.064
2.905	1.221
2.912	0.560
2.996	0.969
3.080	2.580
3.101	0.548
3.105	1.241
3.201	1.010
3.311	1.304
3.422	0.894
3.450	-0.020
3.505	1.235
3.546	0.830
3.586	0.216
3.655	1.019
3.695	0.457
3.717	1.428
3.901	0.545
3.975	1.238
4.002	1.107
4.247	0.449
4.255	1.016
4.309	1.930
4.317	0.365
4.322	1.300
4.359	0.239
4.406	0.963
4.541	0.832
4.609	0.464
4.848	0.626
4.993	0.515
4.995	0.950
5.171	0.372
5.197	0.178
5.266	1.023
5.382	0.435
5.396	0.067
5.406	0.849
5.440	0.177
5.593	0.518
5.597	0.323
5.706	0.328
5.748	0.181
5.760	0.433
5.796	-0.029
5.803	0.433
5.804	0.475
5.904	-0.014
5.912	0.501
6.018	0.075
6.700	0.356];
data.LdL(:,2) = data.LdL(:,2)/ 365; % convert yr to d
units.LdL  = {'cm', 'cm/d'};  label.LdL = {'time since birth', 'change in SVL'};  
temp.LdL   = C2K(10);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'Houc1982';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL = 5 * weights.LdL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Direct divelopment, reproduction is terrestrial; highly arboreal';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '68MWR'; % Cat of Life
metaData.links.id_ITIS = '208424'; % ITIS
metaData.links.id_EoL = '331315'; % Ency of Life
metaData.links.id_Wiki = 'Bolitoglossa_subpalmata'; % Wikipedia
metaData.links.id_ADW = 'Bolitoglossa_subpalmata'; % ADW
metaData.links.id_Taxo = '47463'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Bolitoglossa+subpalmata'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bolitoglossa_subpalmata}}';
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
bibkey = 'Houc1982'; type = 'Article'; bib = [ ... 
'author = {Lynne D. Houck}, ' ... 
'year = {1982}, ' ...
'title = {GROWTH RATES AND AGE AT MATURITY FOR THE PLETHODONTID SALAMANDER \emph{Bolitoglossa subpalmata}}, ' ...
'journal = {Copeia}, ' ...
'volume = {1982(2)}, ' ...
'pages = {474-478}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Bolitoglossa+subpalmata}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/130100}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Bolitoglossa/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

