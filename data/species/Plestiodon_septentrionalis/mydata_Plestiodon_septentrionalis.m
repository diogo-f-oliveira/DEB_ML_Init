function [data, auxData, metaData, txtData, weights] = mydata_Plestiodon_septentrionalis

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Plestiodon_septentrionalis';
metaData.species_en = 'Prairie skink';

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg', '0iTh'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Ln'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 02];

%% set data
% zero-variate data;
data.ab = 45.5;     units.ab = 'd'; label.ab = 'age at birth';               bibkey.ab = 'Brec1943';
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '40 to 50 d';
data.tp = 365;     units.tp = 'd'; label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on value for Plestiodon egregius';
data.am = 8*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'guess';
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on values for other scincidae as given in AnAge';

data.Lb  = 2.5;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth';  bibkey.Lb  = 'Brec1943';  
data.Lp  = 6.5;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'Brec1943';  
data.Li  = 8.3;     units.Li  = 'cm';  label.Li  = 'ultimate SVL';    bibkey.Li  = 'Brec1943';

data.Wwi = 12.84; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Li and LW of Oligosoma_zelandicum: (8.3/6.810)^3*6.712';

data.Ri  = 8/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'Brec1943';
temp.Ri = C2K(24); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 to 12 eggs per clutch, 1 clutch per yr';

% univariate data
% time-length
data.tL = [ ... % age (d), SVL (cm)
2.085	2.539
6.887	2.680
6.906	2.492
18.117	2.750
30.184	3.348
30.528	3.477
30.567	3.090
44.376	4.111
46.744	3.618
47.591	4.064
57.351	4.556
66.781	4.779
66.970	4.673
67.384	4.111
365-14.977	5.447
365-11.807	5.846
365+0.389	6.127
365+0.679	5.834
365+16.662	6.526
365+30.538	6.878
365+30.550	6.760
365+45.851	7.136
365+67.789	7.136
730-18.368	7.218
730+5.870	7.405];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Brec1943';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '7827F'; % Cat of Life
metaData.links.id_ITIS = '208900'; % ITIS
metaData.links.id_EoL = '794676'; % Ency of Life
metaData.links.id_Wiki = 'Plestiodon_septentrionalis'; % Wikipedia
metaData.links.id_ADW = 'Plestiodon_septentrionalis'; % ADW
metaData.links.id_Taxo = '1685496'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Plestiodon&species=septentrionalis'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Plestiodon_septentrionalis}}';   
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
bibkey = 'Brec1943'; type = 'Article'; bib = [ ...
'author = {W. J. Breckenridge}, ' ...
'title = {The Life History of the Black-Banded Skink \emph{Eumeces septentrionalis septentrionalis} ({B}aird)}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {29(3)}, ' ...
'pages = {591-606}, ' ...
'year = {1943}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


