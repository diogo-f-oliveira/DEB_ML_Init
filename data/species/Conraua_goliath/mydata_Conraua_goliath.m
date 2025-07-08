function [data, auxData, metaData, txtData, weights] = mydata_Conraua_goliath

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Conrauidae';
metaData.species    = 'Conraua_goliath'; 
metaData.species_en = 'Goliath frog'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0jFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjHl', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'aj'; 'am'; 'Li'; 'Wwb'; 'Ww_t'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 18]; 

%% set data
% zero-variate data

data.tj = 90;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'Wiki';
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '85 to 95 d';
data.am = 21*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 32;    units.Li  = 'cm';  label.Li  = 'ultimate body length';   bibkey.Li  = 'Wiki';

data.Wwb = 0.0224;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 3.5 mm: pi/6*0.35^3';
data.Ww67 = 22.5; units.Ww67 = 'g';   label.Ww67 = 'wet weight at 67 d since birth';     bibkey.Ww67 = 'Saba1985';
  temp.Ww67 = C2K(27);  units.temp.Ww67 = 'K'; label.temp.Ww67 = 'temperature';
data.Wwp = 600;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'Saba1985';
  comment.Wwp = 'one 600 g female turned out to be mature';
data.Wwi = 3250;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';

data.Ri  = 800/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on several hunderd eggs per clutch, number is very uncertain)';
  
% univariate data
% length-weight
data.LW = [ ... % SVL (cm), wet weight (g)
32   3250
32   2760
22   1510
27.5 1750
27   2250
30   2100
30   2050
30.5 2950
19    600
21   1200
19.3  750
21   1150
17    600
19    700
25   1100];
units.LW  = {'cm', 'g'};  label.LW = {'SVL', 'wet weight'};  
bibkey.LW = 'Saba1985';

%% set weights for all real data
weights = setweights(data, []);
weights.Ww67 = 5 * weights.Ww67;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Only near waterfalls and rapids of Cameroon and Equatorial Guinea';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Tadpoles only feed on Dicraeia warmingii (Podostemaceae)';
metaData.bibkey.F2 = 'EoL'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'XV4Z'; % Cat of Life
metaData.links.id_ITIS = '586341'; % ITIS
metaData.links.id_EoL = '332046'; % Ency of Life
metaData.links.id_Wiki = 'Conraua_goliath'; % Wikipedia
metaData.links.id_ADW = 'Conraua_goliath'; % ADW
metaData.links.id_Taxo = '93036'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Conraua+goliath'; % AmphibiaWeb
metaData.links.id_AnAge = 'Conraua_goliath'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Conraua_goliath}}';
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
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Conraua+goliath}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Conraua_goliath/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Saba1985'; type = 'Article'; bib = [ ...
'doi = {10.1163/156853885x00047}, ' ...
'author = {Sabater-Pi, J.}, ' ...
'title = {Contribution to the Biology of the Giant Frog (\emph{Conraua goliath}, {B}oulenger)}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {6(2)}, ' ...
'pages = {143-153}, ' ...
'year = {1985}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

