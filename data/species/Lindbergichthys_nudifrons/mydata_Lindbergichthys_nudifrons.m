  function [data, auxData, metaData, txtData, weights] = mydata_Lindbergichthys_nudifrons
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Lindbergichthys_nudifrons'; 
metaData.species_en = 'Yellowfin notie'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'bjMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(-1.7); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 29];

%% set data
% zero-variate data
data.ab = 120;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'fishbase';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(-0.9); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 10;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'guess'; 
data.Li = 19.5;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.0042;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 2 mm: pi/6*0.2^3';
data.Wwp = 10.5;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.00537*Lp^3.29, see F1';
data.Wwi = 94.2; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00537*Li^3.29, see F1';

data.Ri =  6886/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-0.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL = [ ... % time(yr), std length (cm)
1.344	4.498
1.424	4.668
3.243	7.919
3.385	7.097
3.448	7.239
3.527	7.578
3.559	7.663
3.575	8.031
3.622	7.635
3.654	8.711
3.685	7.918
3.764	8.342
3.796	7.804
3.797	8.002
3.828	8.229
3.875	8.427
3.954	8.936
3.955	7.888
3.970	8.256
3.986	8.058
3.987	7.548
4.002	8.483
4.112	8.114
4.160	9.275
4.161	9.162
4.162	8.228
4.163	7.973
4.207	8.369
4.239	9.388
4.255	9.077
4.256	8.425
4.334	8.793
4.350	9.388
4.366	8.482
4.427	10.719
4.428	9.501
4.429	9.161
4.430	8.765
4.460	8.425
4.476	9.416
4.492	10.379
4.493	9.926
4.540	10.039
4.541	8.934
4.555	9.104
4.603	9.302
4.619	10.180
4.634	9.500
4.682	9.755
4.714	9.557
4.715	9.302
4.729	9.358
4.776	10.491
4.777	9.811
4.872	9.443
4.903	9.896
4.935	9.103
4.936	8.763
4.937	10.179
4.938	10.547
4.951	10.774
4.982	10.236
5.030	10.915
5.077	10.207
5.078	10.547
5.108	9.754
5.109	10.745
5.125	9.216
5.204	9.980
5.220	11.254
5.221	9.527
5.222	10.122
5.267	8.904
5.283	10.914
5.346	9.328
5.362	10.121
5.394	10.489
5.395	10.744
5.396	11.225
5.397	11.452
5.409	10.942
5.425	10.234
5.457	8.563
5.458	9.441
5.473	11.253
5.488	10.432
5.489	10.517
5.490	11.452
5.520	10.177
5.550	11.820
5.551	10.290
5.552	11.197
5.568	10.885
5.583	11.140
5.615	11.593
5.694	10.488
5.742	11.536
5.757	12.555
5.773	11.422
5.820	11.989
5.821	10.799
5.837	11.082
5.838	11.677
5.868	11.281
5.884	11.394
5.900	11.790
5.931	11.564
5.947	11.082
5.979	10.940
6.026	12.328
6.027	10.969
6.074	11.875
6.105	11.167
6.121	12.044
6.137	11.393
6.185	11.110
6.200	10.600
6.264	11.166
6.279	12.129
6.533	13.063
6.534	12.100
6.643	11.929
6.675	12.269
6.707	11.873
6.722	13.175
6.754	12.920
6.944	13.175
7.118	13.967
7.181	12.834
7.387	13.400
7.434	14.589
7.545	12.663
8.162	14.445
8.209	14.218
8.367	14.954];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
data.tL(:,2) = 1.13 * data.tL(:,2);  % convert SL to TL
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(-0.9);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MesaDona2023'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL =  5 * weights.tL;
weights.ab =  0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f', 'tL_m'}; subtitle1 = {'Data for females, males'};
% set2 = {'LW_f', 'LW_m'}; subtitle2 = {'Data for females, males'};
% metaData.grp.sets = {set1,set2};
% metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00537*(TL in cm)^3.29';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'from photo: TL = 1.13*SL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6QGHZ'; % Cat of Life
metaData.links.id_ITIS = '643051'; % ITIS
metaData.links.id_EoL = '51582914'; % Ency of Life
metaData.links.id_Wiki = 'Lindbergichthys_nudifrons'; % Wikipedia
metaData.links.id_ADW = 'Lindbergichthys_nudifrons'; % ADW
metaData.links.id_Taxo = '444733'; % Taxonomicon
metaData.links.id_WoRMS = '318861'; % WoRMS
metaData.links.id_fishbase = 'Nototheniops-nudifrons'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Lindbergichthys_nudifrons}}';  
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
bibkey = 'RadtHour1990'; type = 'Article'; bib = [ ... 
'author = {Richard L. Radtke and Thomas F. Hourigan}, ' ...
'year = {1990}, ' ...
'title = {Age and Growth of the {A}ntarctic Fish \emph{Nototheniops nudifrons}}, ' ... 
'journal = {Fishery Bulletin, U.S.}, ' ...
'volume = {88}, ' ...
'pages = {557-571}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Nototheniops-nudifrons.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
