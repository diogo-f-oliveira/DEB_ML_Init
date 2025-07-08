function [data, auxData, metaData, txtData, weights] = mydata_Eurycea_tonkawae

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Plethodontidae';
metaData.species    = 'Eurycea_tonkawae'; 
metaData.species_en = 'Jollyville Plateau salamander'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFcc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ah'; 'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 07 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 07 10]; 

%% set data
% zero-variate data

data.ah = 31;      units.ah = 'd';    label.ah = 'age at hatch';        bibkey.ah = 'Bend2017';   
  temp.ah = C2K(15); units.temp.ah = 'K'; label.temp.ah = 'temperature';
data.ab = 45;       units.ab = 'd';    label.ab = 'age at birth';        bibkey.ab = 'Bend2017';   
  temp.ab = C2K(15); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 11*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'Bend2017';   
  temp.am = C2K(15);   units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.29;       units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Bend2017';
  comment.Lb = 'converted from SVL 0.8 cm: 3.86/2.39*0.8';
data.Lp  = 3.86;        units.Lp  = 'cm';  label.Lp  = 'total length at puberty '; bibkey.Lp  = 'Bend2017'; 
  comment.Lp = 'SVL 2.39 cm';
data.Li  = 7.14;         units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Bend2017';
  comment.Li = 'converted from SVL 4.2 cm: 3.86/2.39*4.42';
  
data.Wwi = 3.5;        units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'largest mentioned body weight for E. lucifuga is 3.7 g, not clear if this is maximum weight';

data.Ri  = 17/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(15);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Data from E. lucifuga; 1 clutch each other yr';

% univariate data
% time - length
data.tL = [ ... % time since birth (yr), SVL (cm)
0.005	0.827
0.123	1.277
0.249	1.663
0.432	2.112
0.597	2.383
0.762	2.585
0.966	2.758
1.208	2.914
1.529	3.029
1.854	3.081
2.131	3.115
2.365	3.133
2.637	3.150
3.001	3.150];
data.tL(:,1) = 365 * data.tL(:,1);
data.tL(:,2) = 3.86/2.39 * data.tL(:,2);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'}; 
temp.tL = C2K(13); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bend2017';
comment.tL = 'Data from curve, not points';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 5 * weights.psd.v;
%weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'No clear difference between males and females';
D2 = 'temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Partial cave dweller, but this may be a distinct species';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3D3HT'; % Cat of Life
metaData.links.id_ITIS = '668293'; % ITIS
metaData.links.id_EoL = '332130'; % Ency of Life
metaData.links.id_Wiki = 'Eurycea_tonkawae'; % Wikipedia
metaData.links.id_ADW = 'Eurycea_tonkawae'; % ADW
metaData.links.id_Taxo = '142935'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Eurycea+tonkawae'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eurycea_tonkawae}}';
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
bibkey = 'Bend2017'; type = 'Article'; bib = [ ... 
'doi = {10.1002/ece3.3056}, ' ...
'author = {Nathan F. Bendik}, ' ... 
'year = {2017}, ' ...
'title = {Demographics, reproduction, growth, and abundance of {J}ollyville {P}lateau alamanders, \emph{Eurycea tonkawae}}, ' ...
'journal = {Ecol. Evol.}, ' ...
'volume = {13}, ' ...
'pages = {5002-5015}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/species/4053}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/333692/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

