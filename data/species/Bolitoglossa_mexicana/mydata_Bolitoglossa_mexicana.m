function [data, auxData, metaData, txtData, weights] = mydata_Bolitoglossa_mexicana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Bolitoglossa_mexicana'; 
metaData.species_en = 'Mexican climbing salamander'; 

metaData.ecoCode.climate = {'Am', 'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'jiTf'};
metaData.ecoCode.embryo  = {'Tns'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

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

data.ab = 63;        units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 35*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(25);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.95;       units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'amphibiaweb';
data.Lp  = 7.8;        units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'guess'; 
  comment.Lp = 'based on tp = 9 to 14 yr (AWD)';
data.Lpm  = 5;       units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'guess'; 
  comment.Lpm = 'based on tpm = 4 to 9 yr (AWD)';
data.Li  = 10;         units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'amphibiaweb';
  comment.Li = 'converted from TL 20 cm: SVL = TL/ 2';

data.Wwb = 0.05;        units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
data.Wwi = 78.2;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 65/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(25);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '26 to 40 eggs per clutch, 2 clutches each yr';

% univariate data
% time-length
data.tL = [ ... % time s (d), SVL (cm)
16.128	1.488
53.623	1.594
78.603	1.984
78.612	1.807
78.618	1.683
78.623	1.594
78.627	1.506
78.635	1.346
79.508	2.374
121.630	2.533
122.108	2.232
123.535	1.506
149.372	3.224
181.328	2.994
201.293	1.878
212.331	3.295
255.356	3.898
283.128	4.004
285.447	3.933
301.235	3.012
303.957	4.093
311.365	4.075
327.095	4.287
327.176	2.711
339.128	4.376
340.130	2.888];
data.tL(:,1) = data.tL(:,1) + 10; % convert time to time since birth
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BillBrin1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

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
metaData.links.id_CoL = 'MDQN'; % Cat of Life
metaData.links.id_ITIS = '208398'; % ITIS
metaData.links.id_EoL = '130100'; % Ency of Life
metaData.links.id_Wiki = 'Bolitoglossa_mexicana'; % Wikipedia
metaData.links.id_ADW = 'Bolitoglossa_mexicana'; % ADW
metaData.links.id_Taxo = '47462'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Bolitoglossa+mexicana'; % AmphibiaWeb
metaData.links.id_AnAge = 'Bolitoglossa_mexicana'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bolitoglossa_mexicana}}';
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
bibkey = 'BillBrin1998'; type = 'Article'; bib = [ ... 
'author = {Thomas Bille and Henrik Brings{\o}e}, ' ... 
'year = {1998}, ' ...
'title = {Zu {B}rutpflege und {W}achstum bei \emph{Bolitoglossa mexicana} ({C}audata: {P}lethodontidae)}, ' ...
'journal = {Salamandra, Rheinbach}, ' ...
'volume = {34(3)}, ' ...
'pages = {219-222}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/species/3990}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Bolitoglossa_mexicana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/130100}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Bolitoglossa/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

