  function [data, auxData, metaData, txtData, weights] = mydata_Semaprochilodus_taeniurus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Prochilodontidae';
metaData.species    = 'Semaprochilodus_taeniurus'; 
metaData.species_en = 'Silver prochilodus'; 

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
data.am = 8*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'GuerAmad2018';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.5;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'Based on smae relative length as Prochilodus nigricans: 27.2*19/45';
data.Li = 27.2;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwi = 297;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01738 * 27.2^2.95, see F1; fishbase gives max 605 g';
  
data.Ri = 297/4900*8100/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same rate per gram, compard with Brycon moorei';

% univariate data
% t-L data
data.tL = [ ... % age (d), fork length (cm)
-22 	0.743
7.424	3.714
37.119	6.684
75.475	9.377
107.644	11.512
147.237	12.440
197.966	12.905
254.881	13.369
300.661	14.761
355.102	16.804
389.746	18.475
433.051	19.960
476.356	21.167
527.085	21.538
581.525	21.724
632.254	22.095
690.407	23.210];
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
F1 = 'Weight (g) = 0.01738 * (TL in cm)^2.95 ';
metaData.bibkey.F1    = 'fishbase';
F2 = 'preferred temperature: 23-26 C';
metaData.bibkey.F2    = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '4WFCN'; % Cat of Life
metaData.links.id_ITIS = '163158'; % ITIS
metaData.links.id_EoL = '1010276'; % Ency of Life
metaData.links.id_Wiki = 'Semaprochilodus'; % Wikipedia
metaData.links.id_ADW = 'Semaprochilodus_taeniurus'; % ADW
metaData.links.id_Taxo = '187389'; % Taxonomicon
metaData.links.id_WoRMS = '1150190'; % WoRMS
metaData.links.id_fishbase = 'Semaprochilodus-taeniurus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Semaprochilodus_taeniurus}}';  
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
'howpublished = {\url{http://www.fishbase.se/summary/Semaprochilodus-taeniurus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

