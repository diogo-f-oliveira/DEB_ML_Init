function [data, auxData, metaData, txtData, weights] = mydata_Lithobates_virgatipes

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Ranidae';
metaData.species    = 'Lithobates_virgatipes'; 
metaData.species_en = 'Carpenter frog'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiFm'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 01];

%% set data
% zero-variate data

data.tj = 365;  units.tj = 'd';    label.tj = 'time since birth at puberty'; bibkey.tj = 'ADW';   
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 6.2*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 6.6;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';

data.Wwb = 4.2e-3;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 2 mm: pi/6*0.2^3';
data.Wwi = 18;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'Give1988';

data.Ri  = 550/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '200-600 eggs per clutch, 1 clutch per yr';
  
% univariate data
% weight-spec growth rate
data.Wr = [ ... % weight (g), spec growth rate (g/d)
5.66442	0.00214
5.96591	0.00420
6.09856	0.00352
6.23760	-0.00009
6.59708	0.01545
6.71257	0.00261
6.98250	0.01912
7.04763	0.00932
7.14934	0.00279
7.18929	0.00451
7.64598	0.01558
7.67717	0.00131
7.69439	0.00343
7.95517	0.00412
7.99513	0.00584
8.00089	0.00320
8.67809	0.00338
8.68010	0.00247
8.84049	-0.00091
8.91639	0.00436
8.91940	0.00299
9.00081	0.00574
9.03520	0.00001
9.10302	-0.00102
9.31972	-0.00016
10.30141	0.00071
10.30342	-0.00020
10.42880	0.00243
10.65125	0.00066
10.65301	-0.00014
11.15598	-0.00025
11.26163	0.00142
11.98405	0.00091
12.14394	-0.00224
13.71828	-0.00250
14.15230	-0.00106
14.23534	0.00094
14.35934	0.00421
14.89907	-0.00272
15.11189	-0.00008
16.68987	-0.00200
18.25394	0.00243];
units.Wr  = {'g', 'g/d'};  label.Wr = {'weight', 'spec growth rate'};  
temp.Wr   = C2K(20);  units.temp.Wr = 'K'; label.temp.Wr = 'temperature';
bibkey.Wr = 'Give1988'; 
subtitle.Wr = 'data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.subtitle = subtitle;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3VHR7'; % Cat of Life
metaData.links.id_ITIS = '775123'; % ITIS
metaData.links.id_EoL = '331395'; % Ency of Life
metaData.links.id_Wiki = 'Lithobates_virgatipes'; % Wikipedia
metaData.links.id_ADW = 'Lithobates_virgatipes'; % ADW
metaData.links.id_Taxo = '996590'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rana+virgatipes'; % AmphibiaWeb
metaData.links.id_AnAge = 'Lithobates_virgatipes'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Lithobates_virgatipes}}';
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
bibkey = 'Give1988'; type = 'Article'; bib = [ ... 
'author = {Mac F. Given}, ' ... 
'year = {1988}, ' ...
'title = {Growth Rate and the Cost of Calling Activity in Male Carpenter Frogs, \emph{Rana virgatipes}}, ' ...
'journal = {Behavioral Ecology and Sociobiology}, ' ...
'volume = {22(3)}, ' ...
'pages = {153-160}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rana+virgatipes}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Lithobates_virgatipes/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Lithobates_virgatipes}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

