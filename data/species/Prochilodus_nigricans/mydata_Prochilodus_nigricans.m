  function [data, auxData, metaData, txtData, weights] = mydata_Prochilodus_nigricans
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Prochilodontidae';
metaData.species    = 'Prochilodus_nigricans'; 
metaData.species_en = 'Black prochilodus'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
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
data.ab = 7;  units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'guess';   
  temp.ab = C2K(27); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'GuerAmad2018';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 19;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'fishbase';
data.Li = 45;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 4e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwi = 1.35e3;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01862*45^2.94, see F1';
  
data.GSI = 0.15; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';   bibkey.GSI = 'SilvStew2017';
  temp.GSI = C2K(24.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% univariate data
% time-length
data.tL = [ ... % age (d), fork length (cm)
32  	0.826
65.799	5.077
111.735	9.101
145.255	11.746
186.224	14.047
235.884	14.973
296.718	15.901
356.310	17.746
412.177	20.853
454.388	23.499
523.912	26.035
608.333	27.196
693.997	27.783];
data.tL(:,1) = data.tL(:,1)-32;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GuerAmad2018';
comment.tL = 'Reconstructed data from Amazonas (Brazil) for 1995-1996';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 5 * weights.Wwb;
weights.Lp = 5 * weights.Lp;
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
D1 = 'Temperature (in C) is assumed to vary as T = 25 + 5 * sin(2*pi*(t+30-32)/365)';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Weight (g) = 0.01862 *(TL in cm)^2.94';
metaData.bibkey.F1    = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4MN8N'; % Cat of Life
metaData.links.id_ITIS = '641607'; % ITIS
metaData.links.id_EoL = '217342'; % Ency of Life
metaData.links.id_Wiki = 'Prochilodus_nigricans'; % Wikipedia
metaData.links.id_ADW = 'Prochilodus_nigricans'; % ADW
metaData.links.id_Taxo = '184791'; % Taxonomicon
metaData.links.id_WoRMS = '1011318'; % WoRMS
metaData.links.id_fishbase = 'Prochilodus-nigricans'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Prochilodus_nigricans}}';  
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
bibkey = 'SilvStew2017'; type = 'Article'; bib = [ ...
'author = {Eddy A. Silva and Donald J. Stewart}, ' ...
'year = {2017}, ' ...
'title = {Reproduction, feeding and migration patterns of \emph{Prochilodus nigricans} ({C}haraciformes: {P}rochilodontidae) in northeastern {E}cuador}, ' ... 
'journal = {Neotropical Ichthyology}, ' ...
'volume = {15(3)}, '...
'pages = {e160171}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Prochilodus-nigricans.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

