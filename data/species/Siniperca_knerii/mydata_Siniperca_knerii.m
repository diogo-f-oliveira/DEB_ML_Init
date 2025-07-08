  function [data, auxData, metaData, txtData, weights] = mydata_Siniperca_knerii
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Centrarchiformes'; 
metaData.family     = 'Sinipercidae';
metaData.species    = 'Siniperca_knerii'; 
metaData.species_en = 'Big-eye mandarin fish'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 17];

%% set data
% zero-variate data
data.am = 13*365;        units.am = 'd';  label.am = 'time since birth at death'; bibkey.am = 'guess';
  temp.am = C2K(21); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lp = 17;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
data.Li = 41.5;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'LiuLi2013';

data.Wwb = 9e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';   
  comment.Wwb = 'based on egg diameter of 1.2 mm: pi/6*0.12^3';
data.Wwp = 157;  units.Wwp = 'g'; label.Wwp = 'wet weight at piberty'; bibkey.Wwp = {'LiuLi2013','guess'}; 
  comment.Wwp = 'based on (Lp/Li)^3*Wwi: (17/41.5)^3*2282 g';
data.Wwi = 2282;  units.Wwi = 'g'; label.Wwi = 'ultimate wet weight'; bibkey.Wwi = 'LiuLi2013'; 
  comment.Wwi = 'based on LW data';

data.Ri = 140*2282/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';  bibkey.Ri = 'LiuLi2013';   
  temp.Ri = C2K(21); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on rel fecundity of 140 egg/g';
  
% uni-variate data
% time-length-weight
data.tLW = [ ... % year class (yr), std length (cm), weight (g)
    1 20.41  205.60
    2 27.85  529.26
    3 35.48 1213.08
    4 41.50 2257.8];
data.tLW(:,1) = 365 * (0.5 + data.tLW(:,1)); % convert yr to d
units.tLW = {'d', 'cm', 'g'}; label.tLW = {'time since birth', 'std length', 'weight'};  
temp.tLW = C2K(21);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'LiuLi2013'; treat.tLW = {1 {'length','weight'}};

% length-weight
data.LW = [ ... % std length (cm), weight (g)
11.781	16.979
11.837	46.056
11.839	12.838
12.239	58.596
12.641	50.375
12.813	58.715
12.986	46.295
13.275	29.745
13.560	71.327
13.676	58.894
13.961	96.324
13.964	42.345
14.651	100.619
14.652	67.402
14.939	67.461
15.111	88.258
15.336	179.654
15.630	46.844
15.857	113.326
15.973	92.589
15.975	46.915
16.316	134.183
16.433	80.228
16.949	101.097
17.003	171.696
17.466	105.356
17.522	142.738
17.692	200.905
17.810	126.189
17.981	167.747
18.271	113.827
18.324	196.884
18.844	147.165
18.845	126.404
19.015	176.266
19.127	226.116
19.532	184.678
19.535	114.090
19.875	213.815
20.395	164.096
20.563	238.871
20.623	193.209
20.740	155.863
21.023	238.967
21.026	176.684
21.365	297.169
21.369	222.429
21.596	276.456
21.712	247.414
21.830	201.764
22.233	181.086
22.346	222.632
22.402	247.557
22.572	309.876
22.573	289.115
22.978	231.068
23.088	334.897
23.150	222.799
23.321	264.357
23.606	314.243
23.893	310.151
24.061	418.144
24.066	297.730
24.578	409.947
24.695	364.296
24.699	281.252
24.978	459.857
24.985	314.529
25.095	418.359
25.494	484.878
25.672	381.108
25.784	443.415
25.842	414.361
26.190	356.302
26.243	451.815
26.417	426.937
26.471	493.385
26.874	485.164
26.990	447.818
27.042	559.939
27.506	468.686
27.561	530.981
27.616	576.667
27.907	506.140
28.419	622.509
28.425	485.486
28.480	551.933
28.539	506.271
28.708	581.046
29.169	556.229
29.343	518.895
29.394	664.234
29.511	622.736
29.560	801.292
29.577	431.746
29.857	585.437
30.371	656.132
30.482	735.048
30.774	635.455
31.459	731.099
32.373	847.551
35.053	1288.246
36.895	1226.345
37.342	1508.790
41.500	2281.972];
units.LW = {'cm', 'g'}; label.LW = {'std length', 'weight'};  
bibkey.LW = 'LiuLi2013';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tLW = 10 * weights.tLW;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.Wwb = 5 * weights.Wwb;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_D','tL_H'}; subtitle1 = {'Data from Duke Swamp, Hoggard Mill Creek'};
% set2 = {'tWw_D','tWw_H'}; subtitle2 = {'Data from Duke Swamp, Hoggard Mill Creek'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.01202*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length from photo: SL = 0.78 * TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6Z3FJ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Siniperca'; % Wikipedia
metaData.links.id_ADW = 'Siniperca_knerii'; % ADW
metaData.links.id_Taxo = '187744'; % Taxonomicon
metaData.links.id_WoRMS = '282798'; % WoRMS
metaData.links.id_fishbase = 'Siniperca-knerii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Siniperca_knerii}}';
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
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Siniperca-knerii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LiuLi2013'; type = 'Article'; bib = [ ...  
'doi = {10.3724/SP.J.1118.2012.00229}, ' ...
'author = {Liu, L. and G. Li and S. Chen and X. Lu and D. Luo and H. Wang}, ' ...
'year = {2013}, ' ...
'title  = {Age and growth of bigeye mandarinfish (\emph{Siniperca kneri}) in {G}uishi {R}eservoir, {G}uangxi {P}rovince}, ' ...
'journal = {Journal of Fishery Sciences of China}, ' ...
'volume = {19(2)}, ' ...
'pages = {229-236}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

