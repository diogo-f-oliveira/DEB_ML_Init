  function [data, auxData, metaData, txtData, weights] = mydata_Austrolebias_wolterstorffi
  %% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cyprinodontiformes'; 
metaData.family     = 'Rivulidae';
metaData.species    = 'Austrolebias_wolterstorffi'; 
metaData.species_en = 'Killifish'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFp'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ni'};  
metaData.data_1     = {'t-L_T'; 't-Ww_T'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 03];                          
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU Univ. Amsterdam'};      

metaData.curator   = {'Starrlight Augustine'};    
metaData.email_cur = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.date_acc    = [2020 10 03]; 

%% set data
% zero-variate data
data.tp = 30;        units.tp = 'd';  label.tp = 'time since birth at puberty';  bibkey.tp = 'FonsVolc2013';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 200;        units.am = 'd';  label.am = 'life span';  bibkey.am = 'FonsVolc2013';
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb  = 0.877;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'FonsVolc2013';  
  comment.Lb = 'based on SL 0.71 cm and F3';
data.Lp = 2.6;     units.Lp = 'cm';     label.Lp = 'total length at puberty';  bibkey.Lp = 'FonsVolc2013';
  comment.Lp = 'based on SL 2.1 cm and F3, from tp anf tL data';
data.Li = 10;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwi  = 7.5;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';    bibkey.Wwi  = 'FonsVolc2013';
  comment.Wwi = 'based on  0.0029*Li^3.4123, see F2'; 

data.Ni = 150;  units.Ni = '#'; label.Ni = 'cum # eggs till 200 d';   bibkey.Ni = 'guess';
  temp.Ni = C2K(24); units.temp.Ni = 'K'; label.temp.Ni = 'temperature'; 

% uni-variate data
  
% time - length
data.tL_16f = [ ... % time since birth (d), std length (cm)
 0.000	0.704
18.175	1.269
25.139	1.680
32.325	1.988
39.363	2.370
46.475	2.737
52.928	3.139
59.959	3.565
66.951	4.051];
data.tL_16f(:,2) = data.tL_16f(:,2)/ 0.81; % convert SL to TL
units.tL_16f = {'d', 'cm'}; label.tL_16f = {'time since birth', 'total length', '16 C'};  
temp.tL_16f = C2K(16);  units.temp.tL_16f = 'K'; label.temp.tL_16f = 'temperature';
bibkey.tL_16f = 'FonsVolc2013';
comment.tL_16f = 'Data for females at lab conditions at 16 C';
%
data.tL_20f = [ ... % time since birth (d), std length (cm)
 0.000	0.712
18.171	1.460
25.355	1.900
32.319	2.267
39.355	2.766
46.538	3.199
52.880	3.758
59.950	4.124
66.945	4.429];
data.tL_20f(:,2) = data.tL_20f(:,2)/ 0.81; % convert SL to TL
units.tL_20f = {'d', 'cm'}; label.tL_20f = {'time since birth', 'total length', '20 C'};  
temp.tL_20f = C2K(20);  units.temp.tL_20f = 'K'; label.temp.tL_20f = 'temperature';
bibkey.tL_20f = 'FonsVolc2013';
comment.tL_20f = 'Data for females at lab conditions at 20 C';
%
data.tL_24f = [ ... % time since birth  (d), std length (cm)
 0.000	0.712
18.243	1.556
25.280	1.944
32.245	2.319
39.431	2.612
46.391	3.221
52.881	3.672
59.989	4.021
66.947	4.309];
data.tL_24f(:,2) = data.tL_24f(:,2)/ 0.81; % convert SL to TL
units.tL_24f = {'d', 'cm'}; label.tL_24f = {'time since birth', 'total length', '24 C'};  
temp.tL_24f = C2K(24);  units.temp.tL_24f = 'K'; label.temp.tL_24f = 'temperature';
bibkey.tL_24f = 'FonsVolc2013';
comment.tL_24f = 'Data for females at lab conditions at 24 C';
%
data.tL_28f = [ ... % time since birth  (d), std length (cm)
 0.000	0.712
18.171	1.453
25.284	1.746
32.250	2.084
39.291	2.326
46.478	2.583
52.928	3.087
60.002	3.203
66.999	3.423];
data.tL_28f(:,2) = data.tL_28f(:,2)/ 0.81; % convert SL to TL
units.tL_28f = {'d', 'cm'}; label.tL_28f = {'time since birth', 'total length', '28 C'};  
temp.tL_28f = C2K(28);  units.temp.tL_28f = 'K'; label.temp.tL_28f = 'temperature';
bibkey.tL_28f = 'FonsVolc2013';
comment.tL_28f = 'Data for females at lab conditions at 28 C';
%
data.tL_16m = [ ... % time since birth (d), std length (cm)
 0.000	0.704
18.175	1.269
25.139	1.680
32.325	1.988
39.363	2.370
46.475	2.737
52.876	3.405
59.774	3.812
66.668	4.434];
data.tL_16m(:,2) = data.tL_16m(:,2)/ 0.81; % convert SL to TL
units.tL_16m = {'d', 'cm'}; label.tL_16m = {'time since birth', 'total length', '16 C'};  
temp.tL_16m = C2K(16);  units.temp.tL_16m = 'K'; label.temp.tL_16m = 'temperature';
bibkey.tL_16m = 'FonsVolc2013';
comment.tL_16m = 'Data for males at lab conditions at 16 C';
%
data.tL_20m = [ ... % time since birth (d), std length (cm)
 0.000	0.712
18.171	1.460
25.355	1.900
32.319	2.267
39.355	2.766
46.538	3.199
45.865	3.454
52.766	3.723
59.767	4.156
66.717	4.580];
data.tL_20m(:,2) = data.tL_20m(:,2)/ 0.81; % convert SL to TL
units.tL_20m = {'d', 'cm'}; label.tL_20m = {'time since birth', 'total length', '20 C'};  
temp.tL_20m = C2K(20);  units.temp.tL_20m = 'K'; label.temp.tL_20m = 'temperature';
bibkey.tL_20m = 'FonsVolc2013';
comment.tL_20m = 'Data for males at lab conditions at 20 C';
%
data.tL_24m = [ ... % time since birth  (d), std length (cm)
 0.000	0.712
18.243	1.556
25.280	1.944
32.245	2.319
39.431	2.612
46.391	3.221
45.865	3.437
52.817	3.740
59.819	4.139
66.665	4.589];
data.tL_24m(:,2) = data.tL_24m(:,2)/ 0.81; % convert SL to TL
units.tL_24m = {'d', 'cm'}; label.tL_24m = {'time since birth', 'total length', '24 C'};  
temp.tL_24m = C2K(24);  units.temp.tL_24m = 'K'; label.temp.tL_24m = 'temperature';
bibkey.tL_24m = 'FonsVolc2013';
comment.tL_24m = 'Data for males at lab conditions at 24 C';
%
data.tL_28m = [ ... % time since birth  (d), std length (cm)
 0.000	0.712
18.171	1.453
25.284	1.746
32.250	2.084
39.291	2.326
46.478	2.583
45.878	2.835
52.889	2.811
59.844	2.986
66.798	3.212];
data.tL_28m(:,2) = data.tL_28m(:,2)/ 0.81; % convert SL to TL
units.tL_28m = {'d', 'cm'}; label.tL_28m = {'time since birth', 'total length', '28 C'};  
temp.tL_28m = C2K(28);  units.temp.tL_28m = 'K'; label.temp.tL_28m = 'temperature';
bibkey.tL_28m = 'FonsVolc2013';
comment.tL_28m = 'Data for males at lab conditions at 28 C';

% time - weight
data.tWw_16f = [ ... % time  (d), wet weight (g)
53.057	0.732
60.070	1.037
67.007	1.424];
units.tWw_16f = {'d', 'g'}; label.tWw_16f = {'time since birth', 'wet weight', '16 C'};  
temp.tWw_16f = C2K(16);  units.temp.tWw_16f = 'K'; label.temp.tWw_16f = 'temperature';
bibkey.tWw_16f = 'FonsVolc2013';
comment.tWw_16f = 'Data for females at lab conditions at 16 C';
%
data.tWw_20f = [ ... % time since birth  (d), wet weight (g)
53.010	1.240
60.021	1.670
66.993	2.218];
units.tWw_20f = {'d', 'g'}; label.tWw_20f = {'time since birth', 'wet weight', '20 C'};  
temp.tWw_20f = C2K(20);  units.temp.tWw_20f = 'K'; label.temp.tWw_20f = 'temperature';
bibkey.tWw_20f = 'FonsVolc2013';
comment.tWw_20f = 'Data for females at lab conditions at 20 C';
%
data.tWw_24f = [ ... % time since birth (d), wet weight (g)
52.971	1.276
60.099	1.560
66.994	2.152];
units.tWw_24f = {'d', 'g'}; label.tWw_24f = {'time since birth', 'wet weight', '24 C'};  
temp.tWw_24f = C2K(24);  units.temp.tWw_24f = 'K'; label.temp.tWw_24f = 'temperature';
bibkey.tWw_24f = 'FonsVolc2013';
comment.tWw_24f = 'Data for females at lab conditions at 24 C';
%
data.tWw_28f = [ ... % time since birth (d), wet weight (g)
53.058	0.673
59.998	0.846
67.011	1.159];
units.tWw_28f = {'d', 'g'}; label.tWw_28f = {'time since birth', 'wet weight', '28 C'};  
temp.tWw_28f = C2K(28);  units.temp.tWw_28f = 'K'; label.temp.tWw_28f = 'temperature';
bibkey.tWw_28f = 'FonsVolc2013';
comment.tWw_28f = 'Data for females at lab conditions at 28 C';
%
data.tWw_16m = [ ... % time  (d), wet weight (g)
52.731	0.861
59.317	1.209
65.945	1.866];
units.tWw_16m = {'d', 'g'}; label.tWw_16m = {'time since birth', 'wet weight', '16 C'};  
temp.tWw_16m = C2K(16);  units.temp.tWw_16m = 'K'; label.temp.tWw_16m = 'temperature';
bibkey.tWw_16m = 'FonsVolc2013';
comment.tWw_16m = 'Data for males at lab conditions at 16 C';
%
data.tWw_20m = [ ... % time since birth  (d), wet weight (g)
46.037	0.932
52.675	1.162
59.307	1.650
65.936	2.271];
units.tWw_20m = {'d', 'g'}; label.tWw_20m = {'time since birth', 'wet weight', '20 C'};  
temp.tWw_20m = C2K(20);  units.temp.tWw_20m = 'K'; label.temp.tWw_20m = 'temperature';
bibkey.tWw_20m = 'FonsVolc2013';
comment.tWw_20m = 'Data for males at lab conditions at 20 C';
%
data.tWw_24m = [ ... % time since birth (d), wet weight (g)
45.988	0.968
52.673	1.273
59.302	1.864
65.833	2.484];
units.tWw_24m = {'d', 'g'}; label.tWw_24m = {'time since birth', 'wet weight', '24 C'};  
temp.tWw_24m = C2K(24);  units.temp.tWw_24m = 'K'; label.temp.tWw_24m = 'temperature';
bibkey.tWw_24m = 'FonsVolc2013';
comment.tWw_24m = 'Data for males at lab conditions at 24 C';
%
data.tWw_28m = [ ... % time since birth (d), wet weight (g)
46.045	0.600
52.686	0.647
59.276	0.834
65.962	1.064];
units.tWw_28m = {'d', 'g'}; label.tWw_28m = {'time since birth', 'wet weight', '28 C'};  
temp.tWw_28m = C2K(28);  units.temp.tWw_28m = 'K'; label.temp.tWw_28m = 'temperature';
bibkey.tWw_28m = 'FonsVolc2013';
comment.tWw_28m = 'Data for females at lab conditions at 28 C';

%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 5 * weights.Lb;
weights.Wwi = 0 * weights.Wwi;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_28f', 'tL_24f', 'tL_20f', 'tL_16f'}; subtitle1 = {'Data for females at 28, 24, 20, 16 C'};
set2 = {'tL_28m', 'tL_24m', 'tL_20m', 'tL_16m'}; subtitle2 = {'Data for males at 28, 24, 20, 16 C'};
set3 = {'tWw_28f', 'tWw_24f', 'tWw_20f', 'tWw_16f'}; subtitle3 = {'Data for females at 28, 24, 20, 16 C'};
set4 = {'tWw_28m', 'tWw_24m', 'tWw_20m', 'tWw_16m'}; subtitle4 = {'Data for males at 28, 24, 20, 16 C'};
metaData.grp.sets = {set1,set2,set3,set4};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3,subtitle4};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Anual killifish'; 
metaData.bibkey.F1 = 'FonsVolc2013'; 
F2 = 'length-weight for A. variarius: log W = log 0.0029 + 3.4123 log TL'; 
metaData.bibkey.F2 = 'ErreDanu2001';
F3 = 'length length relationship from photo: SL = 0.81 * TL'; 
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3);

%% Links
metaData.links.id_CoL = 'JWWZ'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '356189'; % Ency of Life
metaData.links.id_Wiki = 'Austrolebias'; % Wikipedia
metaData.links.id_ADW = 'Megalebias_wolterstorffi'; % ADW
metaData.links.id_Taxo = '3413235'; % Taxonomicon
metaData.links.id_WoRMS = '1016489'; % WoRMS
metaData.links.id_fishbase = 'Austrolebias-wolterstorffi'; % fishbase


%% References
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Austrolebias-wolterstorffi.html}}';
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
bibkey = 'FonsVolc2013'; type = 'Article'; bib = [ ...
'author = {Alinca Peres da Fonseca and Matheus Vieira Volcan and Luis Andre Sampaio and Luis Alberto Romano and Ricardo Berteaux Robaldo}, ' ...
'year = {2013}, ' ...
'title = {Growth of Critically Endangered annual fish \emph{Austrolebias wolterstorffi} ({C}yprinodontiformes: {R}ivulidae) at different temperatures}, ' ...
'journal = {Neotropical Ichthyology}, ' ...
'volume = {11(4)}, ' ...
'pages = {837-844}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ErreDanu2001'; type = 'Article'; bib = [ ...
'author = {Adriana Erreaa and Eva Danulatb}, ' ...
'year = {2001}, ' ...
'title = {Growth of the annual fish, \emph{Cynolebias viarius} ({C}yprinodontiformes), in the natural habitat compared to laboratory conditions}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {61}, ' ...
'pages = {261-268}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


