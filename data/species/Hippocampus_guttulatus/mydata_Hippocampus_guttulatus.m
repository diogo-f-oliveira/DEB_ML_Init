function [data, auxData, metaData, txtData, weights] = mydata_Hippocampus_guttulatus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Syngnathiformes'; 
metaData.family     = 'Syngnathidae';
metaData.species    = 'Hippocampus_guttulatus'; 
metaData.species_en = 'Long-snouted seahorse'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMcd', '0iMr'};
metaData.ecoCode.embryo  = {'Mbm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18.6); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L0-Lt'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2019 02 14];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator   = {'Starrlight Augustine'};
metaData.email_cur = {'sta@akvaplan.niva.no'}; 
metaData.date_acc  = [2019 02 14]; 

%% set data
% zero-variate data

data.ab = 21;      units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'fishbase';   
  temp.ab = C2K(18.6);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 8*7;      units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'CurtVinc2006';   
  temp.tj = C2K(18.6);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.am = 5.5*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'CurtVinc2006';   
  temp.am = C2K(18.6);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.2;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';      bibkey.Lb  = 'CurtVinc2006';  
data.Lp  = 10.9;  units.Lp  = 'cm';  label.Lp  = 'total length at puberty';      bibkey.Lp  = 'CurtVinc2006';  
data.Li  = 21.5;  units.Li  = 'cm';  label.Li  = 'ultimate total length';        bibkey.Li  = 'fishbase';

data.Wwb = 2.39e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'PlanQuin2010';
data.Wwp = 3.4;   units.Wwp = 'g';   label.Wwp = 'ultimate wet weight';       bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00302*Lp^2.94, see F2';
data.Wwi = 25;   units.Wwi = 'g';   label.Wwi = 'wet weight at puberty';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00302*Li^2.94, see F2';

data.Ri  = 6*581/365;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(18.6);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on 581 eggs per clutch, 6 clutches per yr';
 
% uni-variate data
% initial length-length after 1 yr
data.LL_f = [ ...
10.512	15.312
10.529	16.184
10.531	14.928
10.531	14.543
10.942	15.572
11.283	15.396
11.713	16.143
11.715	14.963
12.072	15.787
12.074	14.505
12.485	15.355
12.503	15.842
12.880	15.384
12.880	14.973
12.897	15.794
13.292	15.797
13.684	17.365
13.685	16.980
13.685	16.570
13.686	16.185
13.705	15.365
14.079	17.368
14.080	16.522
14.080	16.291
14.081	16.163
14.100	14.907
14.241	16.600
14.242	16.216
14.492	16.602
14.493	16.218
14.494	15.782
14.509	17.423
14.709	15.809
14.870	15.811
14.922	17.042
14.923	16.581
15.280	17.455
15.281	17.250
15.281	17.071
15.281	16.840
15.282	16.173
15.297	18.225
15.298	17.558
15.425	16.790
15.479	16.765
15.479	16.560
15.710	18.254
15.711	17.177
15.711	17.049
15.728	17.869
15.729	17.562
15.729	17.357
15.731	16.203
15.945	17.000
16.105	17.796
16.105	17.565
16.105	17.462
16.124	17.027
16.446	17.696
16.464	17.466
16.517	17.927
16.518	17.645
16.929	18.649
17.127	17.856
17.128	17.574
17.306	18.293
17.520	19.423
17.951	19.068];
units.LL_f   = {'cm', 'cm'};  label.LL_f = {'standard length at t', 'standard length at t+1 yr', 'female'};  
temp.LL_f    = C2K(27.8);  units.temp.LL_f = 'K'; label.temp.LL_f = 'temperature';
bibkey.LL_f = 'CurtVinc2006';
comment.LL_f = 'data for females';
%
data.LL_m = [ ...
12.071	16.274
12.519	16.765
12.716	16.792
12.949	17.179
12.984	17.974
13.435	16.311
13.882	17.238
14.332	15.806
14.366	17.217
14.367	16.525
14.367	16.345
14.384	16.832
14.671	17.219
14.776	18.733
14.816	16.298
14.831	17.964
14.850	17.682
15.013	16.504
15.246	16.711
15.262	17.737
15.731	16.254
15.746	17.972
15.782	17.665
16.175	18.694
16.178	16.745
16.213	17.207
16.231	17.669
16.356	17.721
16.624	18.903
16.624	18.621
16.625	17.698
16.659	19.134
16.912	17.700
17.091	18.214
17.107	19.215
17.108	18.856
17.126	18.625
17.377	19.140
17.573	19.834
17.575	18.680
17.590	20.142
18.058	19.171
18.094	18.864
18.523	20.098
18.524	19.175
18.736	21.511
19.706	20.570
20.943	21.094];
units.LL_m   = {'cm', 'cm'};  label.LL_m = {'standard length at t', 'standard length at t+1 yr', 'male'};  
temp.LL_m    = C2K(27.8);  units.temp.LL_m = 'K'; label.temp.LL_m = 'temperature';
bibkey.LL_m = 'CurtVinc2006';
comment.LL_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.LL_f = 5 * weights.LL_f;
weights.LL_m = 5 * weights.LL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 5 * weights.psd.p_M;
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LL_f','LL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Temperatures are guessed, except for ab';
D2 = 'Masles are assumed not to differ from females';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Preferred temperature for reproduction is 18.6 C';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-weight: Ww in g = 0.00302*(TL in cm)^2.94';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '3LZLR'; % Cat of Life
metaData.links.id_ITIS = '645018'; % ITIS
metaData.links.id_EoL = '46567768'; % Ency of Life
metaData.links.id_Wiki = 'Hippocampus_guttulatus'; % Wikipedia
metaData.links.id_ADW = 'Hippocampus_guttulatus'; % ADW
metaData.links.id_Taxo = '44855'; % Taxonomicon
metaData.links.id_WoRMS = '154776'; % WoRMS
metaData.links.id_fishbase = 'Hippocampus-guttulatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hippocampus_guttulatus}}';
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
bibkey = 'CurtVinc2006'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2006.00952.x}, ' ...
'author = {J. M. R. Curtis and A. C. J. Vincent}, ' ... 
'year = {2006}, ' ...
'title = {Life history of an unusual marine fish: survival, growth and movement patterns of \emph{Hippocampus guttulatus} {C}uvier 1829}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {68}, ' ...
'pages = {707-733}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PlanQuin2010'; type = 'Article'; bib = [ ... 
'author = {M. Planas and P. Quintas and A. Chamorro and C. Silva}, ' ... 
'year = {2010}, ' ...
'title = {Female maturation, egg characteristics and fatty acids profile in theseahorse \emph{Hippocampus guttulatus}}, ' ...
'journal = {Animal Reproduction Science}, ' ...
'volume = {122}, ' ...
'pages = {66-73}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Hippocampus-guttulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
