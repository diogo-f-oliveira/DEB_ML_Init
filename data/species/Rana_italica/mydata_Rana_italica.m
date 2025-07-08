function [data, auxData, metaData, txtData, weights] = mydata_Rana_italica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Rana_italica'; 
metaData.species_en = 'Italian stream frog'; 

metaData.ecoCode.climate = {'BSk', 'Csa', 'Cfb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 05];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 05];

%% set data
% zero-variate data

data.ab = 40;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'guess';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tj = 3*30.5;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'guess';
  temp.tj = C2K(10);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 3*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 9*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'CammAnge1995';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 7.5;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
data.Lim  = 7.5;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'Wiki';

data.Wwb = 0.0031;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'besed on egg diameter of 1.5–2.1 mm: pi/6*0.18^3';
data.Wwi = 101;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on length-weight of Rana muscosa: 76*(7.5/ 6.8)^3';
data.Wwim = 101;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'guess';
  comment.Wwim = 'guess based on length-weight of Rana muscosa: 76*(7.5/ 6.8)^3';

data.Ri  = 903/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'baes on Rana dalmatinaL 1100*101/123 eggs per clutch, assumed: 1 clutch per yr';
  
% univariate data
% time-length data
data.tL_fm = [ ... % time since puberty (yr), SVL (cm)
2 3.853	4.137
3 4.525	4.580
4 4.752	5.040
5 5.225	5.204
6 NaN	5.139
8 NaN	4.808];
data.tL_fm(:,1) = (data.tL_fm(:,1)+0.9) * 365; % convert yr since birth to d since metam
units.tL_fm  = {'d', 'cm'};  label.tL_fm = {'time since metam', 'SVL'};  
temp.tL_fm   = C2K(10);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'CammAnge1995'; treat.tL_fm = {1,'females','males'};
comment.tL_fm = 'Data for females, males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = 10 * weights.tL_fm;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;
weights.Wwb = 3 * weights.Wwb;
%weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '6X364'; % Cat of Life
metaData.links.id_ITIS = '1106680'; % ITIS
metaData.links.id_EoL = '313644'; % Ency of Life
metaData.links.id_Wiki = 'Rana_italica'; % Wikipedia
metaData.links.id_ADW = 'Rana_italica'; % ADW
metaData.links.id_Taxo = '145487'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+italica'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rana_italica}}';
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
bibkey = 'CammAnge1995'; type = 'Article'; bib = [ ... 
'doi = {10.1163/156853895x00109}, ' ...
'author = {Cammarota, Maria and Angelini, Francesco and Guarino, Fabio Maria}, ' ... 
'year = {1995}, ' ...
'title = {A skeletochronological analysis of three syntopic amphibian species from southern {I}taly}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {16(3)}, ' ...
'pages = {297–302}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+italica}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

