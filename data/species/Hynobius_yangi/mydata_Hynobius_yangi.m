function [data, auxData, metaData, txtData, weights] = mydata_Hynobius_yangi

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Hynobiidae';
metaData.species    = 'Hynobius_yangi'; 
metaData.species_en = 'Kori salamander'; 

metaData.ecoCode.climate = {'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data

data.ab = 5*7;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 90;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'amphibiaweb';
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2.5*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'amphibiaweb';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 11*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'amphibiaweb';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5.5;     units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'guess'; 
data.Lpm = 5;     units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males'; bibkey.Lpm  = 'guess'; 
data.Li  = 6.14;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'amphibiaweb';
data.Lim  = 6.26;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';   bibkey.Lim  = 'amphibiaweb';

data.Wwb = 1.11e-2;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on egg diameter of 2.70 - 2.84mm: pi/6*0.277^3';
data.Wwi = 2.64;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'guess','amphibiaweb'};
  comment.Wwi = 'guess based on Onychodactylus_japonicus: 9.65*(6.3/9.7)^3';

data.Ri  = 3*66/365;    units.Ri  = '#'; label.Ri  = 'max reprduction rate';     bibkey.Ri  = 'amphibiaweb';   
  temp.Ri = C2K(26); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '66 eggs per clutch; assumed: 3 clutch per season';

% univariate data
% time-length
data.tL_f = [... % time since birth (yr), SVL (cm)
0.36640	2.88638
0.38066	2.45466
0.39491	2.33840
0.39491	2.12256
0.45194	2.68692
2.94689	5.43646
2.96115	6.29978
2.96115	5.78508
2.96115	5.56924
2.96115	5.10436
2.96115	6.13375
2.97541	5.23715
2.97541	4.90509
3.95913	5.03532
3.95913	5.13494
3.97339	5.94845
3.97339	6.09788
3.97339	6.56276
3.98764	5.36731
3.98764	6.18086
4.00190	5.53330
4.00190	5.69933
 5	5.64705
 5	6.56018
 5	6.32774
 5	6.11190
 5	5.92926
 5	5.43117
 5	5.28175
 5	4.93301
 5	5.16541
 6	5.39542
 6	5.56141
 6	5.91004
 6	6.29191
 6	6.45794
 6	6.62397
 6	5.19607
 6	5.69416
 6	6.12584
 6	6.88954
 7	6.50524
 7	5.95722
 7	5.82440
 7	5.52554
 7	6.27264
 7	6.10661
 7	5.19345
 7	4.89456
 8	5.90486
 8	6.41956
 8	6.08746
 8	7.41566
 8	5.32361
 8	6.23677
 9	6.45007
 9	6.88171
 9	6.11797
 9	5.25461
10	6.63015
11	6.72707];
data.tL_f(:,1) = (data.tL_f(:,1)+0.5) * 365; % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f  = {'d', 'cm'}; label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(15); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'LeeMin2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [... % time since birth (yr), SVL (cm)
0.35757	2.66408
0.35757	2.54819
0.38617	2.16728
0.38617	1.88582
0.40048	2.84602
0.40048	2.34934
1.98808	4.27985
1.98808	4.08117
2.93206	5.02098
2.96067	5.88179
2.96067	5.48443
2.97497	5.12014
2.97497	4.80557
2.97497	4.45789
3.96186	4.83459
3.97616	5.86103
3.99046	4.95037
3.99046	6.30799
4.00477	5.18210
4.00477	5.44700
4.94875	6.43647
4.94875	6.10534
4.96305	5.26091
4.97735	5.77410
4.97735	5.57542
4.97735	4.96284
4.97735	4.84695
4.97735	4.48271
5.97855	4.95870
5.97855	5.10770
6.00715	5.27315
6.00715	5.76984
6.00715	6.06785
6.02145	5.50488
6.96544	5.46786
6.97974	6.69296
6.97974	6.17972
6.97974	5.99760
6.97974	5.83204
6.97974	5.33535
6.99404	5.66642
7.00834	6.26238
7.99523	5.97684
7.99523	5.71194
7.99523	5.56293
10.9845	6.09692];
data.tL_m(:,1) = (data.tL_m(:,1)+0.5) * 365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m  = {'d', 'cm'}; label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(15); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'LeeMin2010';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f; 
weights.tL_m = 3 * weights.tL_m; 

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';     
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '3NLV7'; % Cat of Life
metaData.links.id_ITIS = '668227'; % ITIS
metaData.links.id_EoL = '332101'; % Ency of Life
metaData.links.id_Wiki = 'Hynobius_yangi'; % Wikipedia
metaData.links.id_ADW = 'Hynobius_yangi'; % ADW
metaData.links.id_Taxo = '695766'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Hynobius+yangi'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hynobius_yangi}}';
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
bibkey = 'Spar2014'; type = 'Book'; bib = [ ... 
'author = {Sparreboom, Max}, ' ...
'year = {2014}, ' ...
'title  = {Salamanders of the Old World}, ' ...
'publisher = {KNNV publishing, Zeist}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LeeMin2010'; type = 'Article'; bib = [ ... 
'author = {Jung-Hyun Lee and Mi-Sook Min and Tae-Ho Kim and  Hae-Jun Baek and Hang Lee and Daesik Park}, ' ... 
'year = {2010}, ' ...
'title = {Age structure and growth rates of two {K}orean salamander species (\emph{Hynobius yangi} and \emph{Hynobius quelpaertensis}) from field populations}, ' ...
'journal = {Animal Cells and Systems}, ' ...
'volume = {14(4)}, ' ...
'pages = {315-322}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Hynobius+yangi}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

