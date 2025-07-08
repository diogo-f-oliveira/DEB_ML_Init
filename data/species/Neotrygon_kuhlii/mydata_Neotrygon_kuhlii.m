function [data, auxData, metaData, txtData, weights] = mydata_Neotrygon_kuhlii
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Myliobatiformes'; 
metaData.family     = 'Dasyatidae';
metaData.species    = 'Neotrygon_kuhlii'; 
metaData.species_en = 'Bluespotted stingray'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MASE','MIW'};
metaData.ecoCode.habitat = {'0iMr'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.8); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 30];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 01];

%% set data
% zero-variate data;
data.ab = 10*30.5; units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(27.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 15*365; units.am = 'd';   label.am = 'life span';                bibkey.am = 'JacoBenn2010';   
  temp.am = C2K(27.8); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 11; units.Lb  = 'cm';  label.Lb  = 'disc width at birth';   bibkey.Lb  = 'JacoBenn2010';
data.Lp  = 28; units.Lp  = 'cm';  label.Lp  = 'disc widthat puberty'; bibkey.Lp  = 'JacoBenn2010';
data.Lpm  = 26.5; units.Lpm  = 'cm';  label.Lpm  = 'disc width at puberty for males'; bibkey.Lpm  = 'JacoBenn2010';
data.Li  = 40.2;   units.Li  = 'cm';  label.Li  = 'ultimate disc width';   bibkey.Li  = 'JacoBenn2010';
data.Lim  = 35;   units.Lim  = 'cm';  label.Lim  = 'ultimate disc width for males';   bibkey.Lim  = 'JacoBenn2010';

data.Wwi = 2024.7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'JacoBenn2010';
data.Wwim = 1229; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';     bibkey.Wwim = 'JacoBenn2010';

data.Ri  = 1.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(27.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-2 pups per litter, assumed 1 litter per yr';
  
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), disc width (cm)
1.092	12.277
1.094	13.594
1.096	14.253
1.097	15.194
1.098	16.041
1.525	16.422
2.078	14.734
2.079	15.393
2.115	16.993
3.004	20.485
3.126	15.121
3.137	21.898
3.623	18.609
3.626	20.680
4.079	17.390
4.093	25.955
4.119	21.720
4.607	20.407
4.613	23.608
6.157	27.200
7.007	26.550
7.627	25.710
7.632	28.533
8.115	24.021
8.581	28.920
9.110	31.655
9.131	24.690
9.173	30.526
9.630	29.589
9.698	31.190
10.165	36.936
11.120	40.240
11.664	32.811
12.196	37.804
13.209	36.874
14.314	31.897
15.234	34.542
15.239	37.177
15.240	37.836];
data.tL_f(:,1) = 365 * (0 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};  label.tL_f = {'time since birth', 'disc width', 'female'};  
  temp.tL_f = C2K(22); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'JacoBenn2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), disc width (cm)
0.604	14.060
0.606	15.283
1.032	15.100
1.099	16.606
1.100	16.983
1.625	17.835
2.087	20.099
2.116	17.558
3.098	18.039
3.108	23.874
4.083	20.026
4.148	19.462
5.140	25.684
5.168	23.237
6.149	22.682
6.158	27.953
7.071	25.892
8.116	24.397
8.129	32.680
9.241	32.032
11.106	31.675
11.170	30.735
12.123	33.192
12.611	31.691
12.679	32.821
13.168	31.979
13.729	34.432
15.169	34.918];
data.tL_m(:,1) = 365 * (0 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};  label.tL_m = {'time since birth', 'disc width', 'male'};  
  temp.tL_m = C2K(22); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'JacoBenn2010';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.2; 

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g =  5.05e-5*(DW in mm)^2.913';
metaData.bibkey.F1 = 'JacoBenn2010';
F2 = 'ovoviviparous';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '46W32'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46560960'; % Ency of Life
metaData.links.id_Wiki = 'Neotrygon_kuhlii'; % Wikipedia
metaData.links.id_ADW = 'Neotrygon_kuhlii'; % ADW
metaData.links.id_Taxo = '1684034'; % Taxonomicon
metaData.links.id_WoRMS = '398330'; % WoRMS
metaData.links.id_fishbase = 'Neotrygon-kuhlii'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Neotrygon_kuhlii}}'; 
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
bibkey = 'JacoBenn2010'; type = 'Article'; bib = [ ... 
'doi = {10.1111/j.1095-8649.2010.02829.x}, ' ...
'author = {I. P. Jacobsen and M. B. Bennett}, ' ...
'year = {2010}, ' ...
'title  = {Age and growth of \emph{Neotrygon picta}, \emph{Neotrygon annotata} and \emph{Neotrygon kuhlii} from north-east {A}ustralia, with notes on their reproductive biology}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {77}, ' ...
'pages = {2405-2422}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Neotrygon-kuhlii.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  