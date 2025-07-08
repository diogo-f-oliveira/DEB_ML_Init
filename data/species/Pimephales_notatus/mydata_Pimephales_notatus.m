function [data, auxData, metaData, txtData, weights] = mydata_Pimephales_notatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Pimephales_notatus'; 
metaData.species_en = 'Bluntnose minnow'; 

metaData.ecoCode.climate = {'Cfa','Dfa','Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fp'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'bpCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 09 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 03]; 

%% set data
% zero-variate data

data.am = 5*365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 5;    units.Lp = 'cm'; label.Lp = 'total length at puberty';      bibkey.Lp = 'guess'; 
  comment.Lp = 'based on tp 1 yr and tL data';
data.Li = 11;    units.Li = 'cm'; label.Li = 'ultimate total length';         bibkey.Li = 'fishbase'; 
  
data.Wwb = 7e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'Cobu1986';
  comment.Wwb = 'based on egg diameter of 1.1 mm: pi/6*0.11^3';

data.Ri = 4195/365;   units.Ri = '#/d';  label.Ri = 'reprod rate at 6.8 cm';    bibkey.Ri = 'Gale1983';
  temp.Ri = C2K(15); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

%% univariate data
 
% time-length
data.tL = [ ... % time (d), total length (cm)
1.372	2.819
10.181	3.062
24.225	3.458
39.813	3.663
52.576	3.817
66.038	3.996
80.214	4.176
94.436	4.279
107.223	4.394
121.367	4.625
137.733	4.728
150.449	4.958
163.188	5.150
177.419	5.241
190.174	5.407
205.809	5.536
219.193	5.843
233.408	5.959
247.638	6.049
259.664	6.241
274.585	6.370
290.173	6.575
302.944	6.716
316.468	6.793
331.366	6.960];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GillWeat1984';

% time-weight
data.tWw = [ ... % time (d), wet weight (g)
1.372	0.222
17.538	0.379
28.311	0.490
44.485	0.637
56.816	0.739
71.474	0.841
83.848	0.887
98.484	1.016
111.584	1.127
126.910	1.367
140.024	1.460
153.074	1.635
166.748	2.005
181.399	2.115
196.064	2.208
209.028	2.494
223.385	2.984
237.274	3.076
249.527	3.279
264.077	3.520
279.325	3.861
291.441	4.240
306.020	4.443
320.649	4.582
334.417	4.831];
units.tWw = {'d', 'g'}; label.tWw = {'time since birth', 'twet weight'};  
temp.tWw = C2K(25);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'GillWeat1984';


%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4HWSS'; % Cat of Life
metaData.links.id_ITIS = '163516'; % ITIS
metaData.links.id_EoL = '208303'; % Ency of Life
metaData.links.id_Wiki = 'Pimephales_notatus'; % Wikipedia
metaData.links.id_ADW = 'Pimephales_notatus'; % ADW
metaData.links.id_Taxo = '183915'; % Taxonomicon
metaData.links.id_WoRMS = '881380'; % WoRMS
metaData.links.id_fishbase = 'Pimephales-notatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pimephales_notatus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Pimephales-notatus.html}}';  
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
bibkey = 'GillWeat1984'; type = 'Article'; bib = [ ... 
'author = {H. S. Gill and A. H. Weatherley}, ' ... 
'year = {1984}, ' ...
'title = {Protein, lipid and caloric contents of bluntnose minnow, \emph{Pimephales notatus} {R}afinesque, during growth at different temperatures}, ' ...
'journal = {J. Fish. Biol.}, ' ...
'volume = {25}, ' ...
'pages = {491-500}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Gale1983'; type = 'Article'; bib = [ ... 
'doi = {10.1577/1548-8659(1983)112<398:FASFOC>2.0.CO;2}, ' ...
'author = {William F. Gale}, ' ... 
'year = {1983}, ' ...
'title = {Fecundity and Spawning Frequency of Caged Bluntnose Minnows Fractional Spawners}, ' ...
'journal = {Transactions of the American Fisheries Society}, ' ...
'volume = {112(3)}, ' ...
'pages = {398-402}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Cobu1986'; type = 'Article'; bib = [ ... 
'author = {Coburn, Miles M.}, ' ... 
'year = {1986}, ' ...
'title = {Egg Diameter Variation in {E}astern {N}orth {A}merican {M}innows ({P}isces: {C}yprinidae): {C}orrelation with Vertebral Number, Habitat and Spawning Behavior}, ' ...
'journal = {The Ohio Journal of Science}, ' ...
'volume = {86(1)}, ' ...
'pages = {110-120}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

    

