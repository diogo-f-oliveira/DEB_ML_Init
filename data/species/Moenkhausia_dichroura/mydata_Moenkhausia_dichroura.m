  function [data, auxData, metaData, txtData, weights] = mydata_Moenkhausia_dichroura
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Characidae';
metaData.species    = 'Moenkhausia_dichroura'; 
metaData.species_en = 'Bandtail tetra'; 

metaData.ecoCode.climate = {'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
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
data.am = 6*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 3.9;    units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based on same relative length, compared to Brycon moorei: 8*17/35';
data.Li = 8;    units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';
  comment.Li = 'converted from TL of 10 cm';


data.Wwb = 4e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwi = 13.2;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*10^3.02, see F2';
  
data.Ri = 13.2/4900*8100/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same rate per gram, compard with Brycon moorei';

% univariate data
% time-length
data.tL = [ ... % age (d), standard length (cm)
338      	1.178
363.635 	1.821
365+1.022	1.731
365+37.779	2.740
365+72.775	3.521
365+110.180	3.985
365+147.594	4.358
365+179.681	4.503
365+221.878	4.604
365+279.530	4.709
365+320.515	5.038
365+363.861	5.548
730+0.063	5.412
730+43.413	5.878
730+79.638	6.250
730+120.033	6.533
730+162.820	6.680
730+223.458	6.650
730+271.600	6.753
730+319.750	6.765
730+363.122	7.003
1095-1.283	7.003
1095+34.960	7.194
1095+74.184	7.294];
data.tL(:,1) = data.tL(:,1)-338;
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CunhCate2007';
comment.tL = 'Reconstructed data from Baia da Onca, a Pantanal lake, Mato Grosso do Sul (Brazil) for 1988';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperature (in C) is assumed to vary as T = 24 + 5 * sin(2*pi*(t+30-338)/365)';
D2 = 'From photo: SL = 0.8 * TL';
metaData.discussion = struct('D1', D1,'D2', D2);

%% Facts
F1 = 'Preferred temp: 22-26 C';
metaData.bibkey.F1    = 'fishbase';
F2 = 'Weight (g) = 0.01259 * TL (in cm)^3.02';
metaData.bibkey.F2    = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '73MXQ'; % Cat of Life
metaData.links.id_ITIS = '641393'; % ITIS
metaData.links.id_EoL = '205937'; % Ency of Life
metaData.links.id_Wiki = 'Moenkhausia'; % Wikipedia
metaData.links.id_ADW = 'Moenkhausia_dichroura'; % ADW
metaData.links.id_Taxo = '180207'; % Taxonomicon
metaData.links.id_WoRMS = '1419703'; % WoRMS
metaData.links.id_fishbase = 'Moenkhausia-dichroura'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Moenkhausia}}';  
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
bibkey = 'CunhCate2007'; type = 'Article'; bib = [ ...  
'author = {Cunha, N. L. and Catella, A. C. and Kinas, M. A.}, ' ...
'year  = {2007}, ' ...
'title = {Growth parameters estimates for a small fish of the {P}antanal, {B}razil: \emph{Moenkhausia dichroura} ({C}haraciformes; {C}haracidae)}, ' ...  
'journal = {Braz. J. Biol.}, ' ...
'volume = {67}, ' ...
'pages = {293-297}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Moenkhausia-dichroura.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

