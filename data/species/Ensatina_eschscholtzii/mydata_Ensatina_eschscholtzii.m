function [data, auxData, metaData, txtData, weights] = mydata_Ensatina_eschscholtzii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Ensatina_eschscholtzii'; 
metaData.species_en = 'Ensatina aalamander'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 09];

%% set data
% zero-variate data

data.ab = 138;  units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'AnAge';   
  temp.ab = C2K(12);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 3.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';   
  temp.tp = C2K(12);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 15*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(12);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.89;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth '; bibkey.Lb  = 'guess'; 
data.Lp  = 4.6;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty '; bibkey.Lp  = 'guess'; 
data.Li  = 8.0;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'amphibiaweb';

data.Wwb = 0.0141;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3 mm: pi/6*0.3^3';
data.Wwi = 10.25;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on size-corrected value for Desmognathus quadramaculatus: (8.0/9)^3*14.6';

data.Ri  = 2*14/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-25 eggs per clutch, assumed: 2 clutches each yr';

% univariate data
% length-length
tLtL = [ ...
  788.372	5.415 1717.925	6.289
  267.409	5.025 1703.781	6.700
  898.345	5.899 1713.712	7.305
  470.709	6.007 1692.566	6.404
  466.116	6.114 1695.848	6.612
  532.084	6.209 1719.896	6.814
  481.896	6.309 1719.115	7.002
  891.659	6.511 1707.510	6.800
  783.797	6.518 1684.624	7.318
  281.953	6.518  787.135	6.713
  807.900	6.706  894.104	6.922
  463.605	6.720 1706.673	7.002
  574.415	7.002 1689.302	7.191
  193.629	6.814  463.633	6.713
  216.152	6.383  566.259	6.969];
data.LL = tLtL(:,[2 4]); units.LL = {'cm', 'cm'}; label.LL = {'initial SVL', 'final SVL'};  
time.LL = tLtL(:,3)-tLtL(:,1); units.time.LL = 'd'; label.time.LL = 'time interval';
temp.LL  = C2K(12); units.temp.LL = 'K'; label.temp.LL = 'temperature';
bibkey.LL = 'StauBrow1995'; treat.LL = {0};

%% set weights for all real data
weights = setweights(data, []);
weights.LL = 3 * weights.LL;
weights.Lp = 0 * weights.Lp;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
auxData.time = time;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Terrestrial reproduction, direct divelopment';
metaData.bibkey.F1 = 'amphibiaweb'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39WWZ'; % Cat of Life
metaData.links.id_ITIS = '173732'; % ITIS
metaData.links.id_EoL = '332930'; % Ency of Life
metaData.links.id_Wiki = 'Ensatina_eschscholtzii'; % Wikipedia
metaData.links.id_ADW = 'Ensatina_eschscholtzii'; % ADW
metaData.links.id_Taxo = '93029'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Ensatina+eschscholtzii'; % AmphibiaWeb
metaData.links.id_AnAge = 'Ensatina_eschscholtzii'; % Anage

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Ensatina_eschscholtzii}}';
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
bibkey = 'StauBrow1995'; type = 'Article'; bib = [ ... 
'author = {Nancy L. Staub and Charles W. Brown and David B. Wake}, ' ... 
'year = {1995}, ' ...
'title = {Patterns of Growth and Movements in a Population of \emph{Ensatina eschscholtzii platensis} ({C}audata: {P}lethodontidae) in the {S}ierra {N}evada, {C}alifornia}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {29(4)}, ' ...
'pages = {593-599}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Ensatina+eschscholtzii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\urlhttps://genomics.senescence.info/species/entry.php?species=Ensatina_eschscholtzii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

