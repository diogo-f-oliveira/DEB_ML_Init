  function [data, auxData, metaData, txtData, weights] = mydata_Pagothenia_borchgrevinki
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Nototheniidae';
metaData.species    = 'Pagothenia_borchgrevinki'; 
metaData.species_en = 'Bald notothen'; 

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
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 27];

%% set data
% zero-variate data
data.ab = 95;   units.ab = 'd';  label.ab = 'age at birth';                       bibkey.ab = 'guess';   
  temp.ab = C2K(0); units.temp.ab = 'K'; label.temp.ab = 'temperature';
    comment.ab = 'based on Trematomus_bernacchii';
data.am = 20*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(-1.7); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lp = 15.2;  units.Lp = 'cm'; label.Lp = 'total length at puberty';  bibkey.Lp = 'guess'; 
  comment.Lp = 'based on Trematomus_bernacchii: 18*28/33 cm';
data.Li = 28;    units.Li = 'cm'; label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';

data.Wwb = 0.036;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 4.1 mm of based on Trematomus_bernacchii: pi/6*0.41^3';
data.Wwp = 38.4;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00617*Lp^3.21, see F1';
data.Wwi = 272.7; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00617*Li^3.21, see F1';

data.Ri = 3000/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(-1.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-length
data.tL = [ ... % time(yr), total length (cm)
0.000	8.756
0.589	9.493
1.345	10.595
1.648	11.062
1.771	12.311
1.936	12.316
2.074	12.221
2.109	12.287
2.205	12.421
2.274	12.456
2.384	12.688
2.494	12.560
2.542	12.627
2.652	12.761
2.886	13.554
2.954	14.342
3.085	14.903
3.174	15.332
3.256	15.826
3.346	16.123
3.380	16.157
3.435	16.355
3.545	16.751
3.600	17.048
3.703	17.345
3.868	17.350
3.951	17.418
4.040	17.453
4.212	17.916
4.412	18.380
4.494	18.579
4.590	18.647
4.735	18.815
4.831	19.014
4.934	19.247
5.072	19.349
5.148	19.547
5.285	19.748
5.416	20.046
5.492	20.245
5.622	20.478];
data.tL(:,1) = 365 * data.tL(:,1);  % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time', 'total length'};  
temp.tL = C2K(-1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SakaKond1989';

% time-weight
data.tW = [ ... % time (yr), weight (g)
0.000	12.516
0.519	20.357
1.290	30.821
1.702	61.795
1.841	62.561
1.965	69.941
2.027	69.219
2.111	69.238
2.197	74.036
2.281	72.952
2.382	79.592
2.490	81.086
2.559	79.998
2.606	82.582
2.707	91.796
2.815	95.128
2.877	95.877
2.955	105.453
3.057	120.182
3.143	126.083
3.259	134.197
3.298	140.456
3.391	144.152
3.484	144.173
3.622	143.836
3.653	143.843
3.784	143.504
3.861	144.256
3.970	149.795
3.985	150.901
4.016	149.070
4.102	159.750
4.296	170.823
4.542	167.568
4.627	174.940
4.781	174.606
4.843	175.355
4.913	179.047
5.006	182.376
5.153	187.923
5.199	190.140
5.262	195.668
5.339	200.465
5.462	199.021
5.532	199.772
5.609	201.627];
data.tW(:,1) = 365 * data.tW(:,1);  % convert yr to d
units.tW = {'d', 'g'}; label.tW = {'time', 'weight'};  
bibkey.tW = 'SakaKond1989';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tL =  3 * weights.tL;
weights.tW =  3 * weights.tW;

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
D1 = 'Males are assumed to not differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00617*(TL in cm)^3.21';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4BZMF'; % Cat of Life
metaData.links.id_ITIS = '642902'; % ITIS
metaData.links.id_EoL = '46573007'; % Ency of Life
metaData.links.id_Wiki = 'Pagothenia_borchgrevinki'; % Wikipedia
metaData.links.id_ADW = 'Pagothenia_borchgrevinki'; % ADW
metaData.links.id_Taxo = '182490'; % Taxonomicon
metaData.links.id_WoRMS = '234801'; % WoRMS
metaData.links.id_fishbase = 'Pagothenia-borchgrevinki'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Pagothenia_borchgrevinki}}';  
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
bibkey = 'SakaKond1989'; type = 'Article'; bib = [ ... 
'author = {Shigeru Sakakibara and Yoshiaki Kondo and Teruo Tobayama and Takao Hoshiai}, ' ...
'year = {1989}, ' ...
'title = {GROWTH OF NOTOTHENIID FISH, \emph{Trematomus bernacchii} AND \emph{Pagothenia borchgrevinki} REARED IN AQUARIUM}, ' ... 
'journal = {Proc. NIPR Symp. Polar Biol.}, ' ...
'volume = {2}, ' ...
'pages = {105-110}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Pagothenia-borchgrevinki.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
