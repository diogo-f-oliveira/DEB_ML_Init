function [data, auxData, metaData, txtData, weights] = mydata_Ranodon_sibiricus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Hynobiidae';
metaData.species    = 'Ranodon_sibiricus'; 
metaData.species_en = 'Semirechensk Salamander'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 13];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 13];

%% set data
% zero-variate data

data.ab = 90;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'NishDujs2017';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'NishDujs2017';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 4.5;     units.Lj  = 'cm';  label.Lj  = 'SVL at metam'; bibkey.Lj  = 'NishDujs2017'; 
data.Lp  = 5.5;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males'; bibkey.Lp  = 'NishDujs2017'; 
data.Li  = 12.8;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Spar2014';
  comment.Li = 'TL 12-28 cm, converted to SVL using F2';

data.Wwb = 3.35e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Spar2014';
  comment.Wwb = 'based on egg diameter of 3-5 mm: pi/6*0.4^3';
data.Wwi = 56.2;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Salamandra salamandra of TL 250 mm, weighing 40 g (Wiki): (28/25)^3*40';

data.Ri  = 91/365;    units.Ri  = '#/d'; label.Ri  = 'max reprduction rate';     bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '38-53 eggs per sac, 2 sacs';

% univariate data
% time-length
data.tL = [... % LAG (#), SVL (cm)
3.746	6.160
4.698	6.446
5.778	6.087
6.667	6.502
7.937	6.329
8.762	6.314
9.778	6.730
10.730	6.313
11.873	6.599
12.825	6.799
13.714	7.301
15.810	6.826
16.825	7.112
17.714	6.681
20.762	6.995];
data.tL(:,1) = (data.tL(:,1) + 0.75) * 365; % convert yr to d
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(15); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NishDujs2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';     
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Only known from the mountain system of Junggarian Alatau in Southern Kazakhstan and North-Western Xinjiang';
metaData.bibkey.F1 = 'amphibiaweb'; 
F2 = 'SVL = TL*0.4578, based on photo';
metaData.bibkey.F2 = 'Wiki_R'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '4RFC9'; % Cat of Life
metaData.links.id_ITIS = '668236'; % ITIS
metaData.links.id_EoL = '331230'; % Ency of Life
metaData.links.id_Wiki = 'Ranodon_sibiricus'; % Wikipedia
metaData.links.id_ADW = 'Ranodon_sibiricus'; % ADW
metaData.links.id_Taxo = '47243'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Ranodon+sibiricus'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ranodon_sibiricus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Wiki_R'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ranodon}}';
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
bibkey = 'Spar2014'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Max Sparreboom}, ' ...
'year = {2014}, ' ...
'title  = {Salamanders of the Old World}, ' ...
'publisher = {KNNV publishing, Zeist}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NishDujs2017'; type = 'Article'; bib = [ ... 
'author = {Kanto Nishikawa and Tatjana Dujsebayeva and Masafumi Matsui and Natsuhiko Yoshikawa and Atsushi Tominaga}, ' ... 
'year = {2017}, ' ...
'title = {Historical Demography of an Endangered Salamander, \emph{Ranodon sibiricus} ({A}mphibia, {U}rodela, {H}ynobiidae): {A} Reassessment}, ' ...
'journal = {Zoological Science}, ' ...
'volume = {34}, ' ...
'pages = {18–25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Ranodon+sibiricus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

