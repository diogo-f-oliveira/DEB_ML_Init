  function [data, auxData, metaData, txtData, weights] = mydata_Semaprochilodus_insignis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Prochilodontidae';
metaData.species    = 'Semaprochilodus_insignis'; 
metaData.species_en = 'Kissing prochilodus'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author     = {'Bas Kooijman'};                             
metaData.date_subm  = [2020 05 01];                          
metaData.email      = {'bas.kooijman@vu.nl'};                 
metaData.address    = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.curator    = {'Starrlight Augustine'};
metaData.email_cur  = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc   = [2020 05 01]; 


%% set data
% zero-variate data
data.ab = 1.7;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Brycon_moorei';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.6;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'Based on smae relative length as Prochilodus nigricans: 27.5*19/45';
data.Li = 27.5;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwi = 411;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02042*27.5^2.99, see F1; Wiki gives max 560 g';
  
data.Ri = 411/4900*8100/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same rate per gram, compard with Brycon moorei';

% univariate data
% t-L data
data.tL = [ ... % age (d), fork length (cm)
221 	0.561
258.583	2.527
300.354	5.989
348.093	9.452
403.787	12.727
455.504	14.131
521.144	14.693
582.807	15.816
648.447	17.313
714.087	19.652
775.749	21.243
845.368	22.273
934.877	22.366
1050.245	23.957
];
data.tL(:,1) = data.tL(:,1)+222;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GuerAmad2018';
comment.tL = 'Reconstructed data from Amazonas (Brazil) for 1995-1996';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature (in C) is assumed to vary as T = 25 + 5 * sin(2*pi*(t+220)/365)';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Weight (g) = 0.02042 * (TL in cm)^2.99';
metaData.bibkey.F1    = 'fishbase';
F2 = 'preferred temperature: 23-26 C';
metaData.bibkey.F2    = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4WFCH'; % Cat of Life
metaData.links.id_ITIS = '641718'; % ITIS
metaData.links.id_EoL = '1010275'; % Ency of Life
metaData.links.id_Wiki = 'Semaprochilodus_insignis'; % Wikipedia
metaData.links.id_ADW = 'Semaprochilodus_insignis'; % ADW
metaData.links.id_Taxo = '187386'; % Taxonomicon
metaData.links.id_WoRMS = '1018426'; % WoRMS
metaData.links.id_fishbase = 'Semaprochilodus-insignis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Semaprochilodus_insignis}}';  
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
bibkey = 'GuerAmad2018'; type = 'Article'; bib = [ ...  
'author = {Ana Guerreiro and Sidineia Amadio and Nidia Fabr\''{e} and Vandick Batista}, ' ...
'year  = {2018}, ' ...
'title = {ESTIMATION OF GROWTH PARAMETERS OF FIVE FISH SPECIES ({A}CTINOPTERYGII) CAUGHT IN THE {C}ENTRAL {A}MAZON}, ' ...  
'doi = {10.3750/AIEP/02346}, ' ...
'journal = {ACTA ICHTHYOLOGICA ET PISCATORIA}, ' ...
'volume = {48}, ' ...
'pages = {303-313}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Semaprochilodus-insignis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

