  function [data, auxData, metaData, txtData, weights] = mydata_Brycon_opalinus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Characiformes'; 
metaData.family     = 'Bryconidae';
metaData.species    = 'Brycon_opalinus'; 
metaData.species_en = 'Pirapitinga'; 

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
data.am = 4.6*365;  units.am = 'd';    label.am = 'life span';              bibkey.am = 'GomiCarm2007';   
  temp.am = C2K(27); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 14.5;    units.Lp = 'cm';   label.Lp = 'total length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based on same relative length, compared to Brycon moorei: 29.8*17/35';
data.Li = 29.8;    units.Li = 'cm';   label.Li = 'ultimate standard length';  bibkey.Li = 'GomiCarm2007';
data.Lim = 37.7;    units.Lim = 'cm';   label.Lim = 'ultimate standard length';  bibkey.Lim = 'GomiCarm2007';

data.Wwb = 4e-4;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*.1^3';
data.Wwi = 303;  units.Wwi = 'g';    label.Wwi = 'max wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01 * 29.8^3.04, see F2';
  
data.Ri = 303/4900*8100/365; units.Ri = '#/d'; label.Ri = 'reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(27); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on same rate per gram, compard with Brycon moorei';

% univariate data
% t-L data
data.tL_f = [ ... % age (d), total length (cm)
117  	1.186
163.103	3.729
206.009	5.336
261.800	6.857
316.513	8.564
362.643	10.081
365+20.185	10.185
365+104.394	13.120
365+197.195	15.873
365+286.267	17.318
365+362.983	19.223
730+15.185	18.019
730+105.315	20.210
730+194.920	21.842
730+287.749	23.289
730+364.491	23.981
1095+14.533	23.429
1095+104.688	24.408
1095+196.992	25.294
1095+287.685	26.274
1095+363.354	26.965
1460+13.900	    27.906
1460+104.604	28.326];
data.tL_f(:,1) = data.tL_f(:,1)-117;
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(27);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'GomiCarm2007';
comment.tL_f = 'Data for females: Reconstructed data from Serra do Mar State Park, Brazil';
% males
data.tL_m = [ ... % age (d), total length (cm)
12  	1.039
104.132	7.005
195.919	11.494
287.169	14.392
334.404	15.217
365-0.537	16.031
365+46.162	18.105
365+106.816	20.643
365+150.831	21.807
365+195.919	22.517
365+287.706	24.165
365+361.243	25.801
730+1.610	25.350
730+50.993	26.745
730+104.132	27.800
730+195.919	29.108
730+286.632	29.960
730+360.706	30.915
1095+1.074	30.350
1095+56.360	31.521
1095+104.132	32.119
1095+193.772	32.970
1095+287.169	33.710
1095+363.926	34.326
1460+1.074      33.759
1460+52.066     34.132
1460+103.596	34.391
1460+194.846	35.130];
data.tL_m(:,1) = data.tL_m(:,1)-338;
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(27);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'GomiCarm2007';
comment.tL_m = 'Data for males: Reconstructed data from Serra do Mar State Park, Brazil';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperature (in C) is assumed to vary as T = 24 + 5 * sin(2*pi*(t+30-t_0)/365), with t_0 = 117 d for tL_F, 12 d for tL_m';
D2 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Preferred temp: 22-26 C';
metaData.bibkey.F1    = 'fishbase';
F2 = 'Weight (g) = 0.01 * TL (in cm)^3.04';
metaData.bibkey.F2    = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'NH83'; % Cat of Life
metaData.links.id_ITIS = '640611'; % ITIS
metaData.links.id_EoL = '993709'; % Ency of Life
metaData.links.id_Wiki = 'Brycon'; % Wikipedia
metaData.links.id_ADW = 'Brycon_opalinus'; % ADW
metaData.links.id_Taxo = '164725'; % Taxonomicon
metaData.links.id_WoRMS = '1026388'; % WoRMS
metaData.links.id_fishbase = 'Brycon-opalinus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Brycon}}';  
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
bibkey = 'GomiCarm2007'; type = 'Article'; bib = [ ...  
'author = {Leandro Muller Gomiero and Alberto Luciano Carmassi and Francisco Manoel de Souza Braga1}, ' ...
'year  = {2007}, ' ...
'title = {Crescimento e mortalidade de \emph{Brycon opalinus} ({C}haraciformes, {C}haracidae) no {P}arque {E}stadual da {S}erra do {M}ar, {M}ata {A}tl\^{a}ntica, {E}stado de S\~{a}o {P}aulo}, ' ...  
'journal = {Biota Neotropica}, ' ...
'volume = {7}, ' ...
'pages = {bn00207012007}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Brycon-opalinus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

