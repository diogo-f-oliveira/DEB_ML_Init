function [data, auxData, metaData, txtData, weights] = mydata_Rhyacotriton_variegatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Rhyacotritonidae';
metaData.species    = 'Rhyacotriton_variegatus'; 
metaData.species_en = 'Southern torrent salamander'; 

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bFc', 'biTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 11];

%% set data
% zero-variate data

data.ab = 5.5*30.5;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(9);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 2.25*365;   units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'amphibiaweb';   
  temp.tj = C2K(9);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 3.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(9);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 1.35;      units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'amphibiaweb';
  comment.Lb = 'EoL gives 22 mm TL and 13.5 mm SVL';
data.Lj  = 3.47;      units.Lj  = 'cm';  label.Lj  = 'SVL at metam';   bibkey.Lj  = 'TaitDill2006';
data.Lp  = 4.4;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty '; bibkey.Lp  = 'TaitDill2006'; 
data.Li  = 6.2;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'amphibiaweb';

data.Wwb = 1.03e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'TaitDill2006';
  comment.Wwb = 'based on egg diameter of 2.7 mm: pi/6*0.27^3';
data.Wwi = 1.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'guess based on Plethodon_cinereus';

data.Ri  = 10/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4-16 eggs per clutch, 1 clutch per yr';

% univariate data
% length - change in length
data.LdL = [ ... % SVL (cm), change in SVL (cm/yr)
1.916	0.748
2.258	0.687
2.676	0.462
2.715	0.877
2.954	0.767
3.240	0.714
3.251	0.542
3.323	0.317
3.336	0.287
3.376	0.386
3.379	0.271
3.411	0.437
3.448	0.416
3.746	0.412
3.948	0.055
4.161	0.316
4.531	0.047
4.576	0.217
4.624	-0.022
5.091	-0.017];
data.LdL(:,2) = data.LdL(:,2)/ 365; % convert cm/yr to cm/d
units.LdL   = {'cm', 'cm/d'};  label.LdL = {'SVL', 'change in SVL'};  
temp.LdL   = C2K(9);  units.temp.LdL = 'K'; label.temp.LdL = 'temperature';
bibkey.LdL = 'TaitDill2006'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Males slightly smaller than females';
metaData.bibkey.F1 = 'EoL'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4SP9N'; % Cat of Life
metaData.links.id_ITIS = '208512'; % ITIS
metaData.links.id_EoL = '1018138'; % Ency of Life
metaData.links.id_Wiki = 'Rhyacotriton_variegatus'; % Wikipedia
metaData.links.id_ADW = 'Rhyacotriton_variegatus'; % ADW
metaData.links.id_Taxo = '149402'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Rhyacotriton+variegatus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhyacotriton_variegatus}}';
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
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Rhyacotriton+variegatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/1018138/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Rhyacotriton_variegatus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'TaitDill2006'; type = 'article'; bib = [ ... 
'author = {Cynthia K. Tait and Lowell V. Diller}, ' ... 
'year = {2006}, ' ...
'title = {Life History of the Southern Torrent Salamander (\emph{Rhyacotriton variegatus}) in Coastal Northern {C}alifornia}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {40(1)}, ' ...
'pages = {43-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

