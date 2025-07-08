  function [data, auxData, metaData, txtData, weights] = mydata_Capros_aper
  
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Caproiformes'; 
metaData.family     = 'Caproidae';
metaData.species    = 'Capros_aper'; 
metaData.species_en = 'Boarfish'; 

metaData.ecoCode.climate = {'MB', 'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};        
metaData.date_subm = [2017 04 08];                           
metaData.email     = {'bas.kooijman@vu.nl'};                 
metaData.address   = {'VU University Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 07];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 07];

%% set data
% zero-variate data
data.ap = 3.4*365;  units.ap = 'd';   label.ap = 'age at puberty';         bibkey.ap = 'HussCoad2012';
  temp.ap = C2K(16); units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 30*365; units.am = 'd';   label.am = 'life span';              bibkey.am = 'HussCoad2012';   
  temp.am = C2K(16);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 9.7;   units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'HussCoad2012'; 
data.Li = 30;    units.Li = 'cm';  label.Li = 'ultimate total length for females';  bibkey.Li = 'fishbase';

data.Wwb = 7.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on guessed egg diameter of 1 mm: 4/2*pi*0.05^3';   
data.Wwp = 15.2;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'HussCoad2012';
  comment.Wwp = 'based on 0.0193 * Lp^2.937, see F3';   
data.Wwi = 420;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.0193 * Li^2.937, see F3';   

data.Ri = 2.3e4/365;units.Ri = '#/d'; label.Ri = 'maximum reprod rate';    bibkey.Ri = 'guess';   
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guessed based on kap = 0.9 for a 30 cm fish';
    
% uni-variate data

% time-length
data.tL_f = [ ... % age (yr), total length (cm) 
0.000	2.485
0.000	4.085
0.054	3.005
0.054	3.485
0.911	6.529
0.911	6.889
0.911	7.449
0.964	5.569
0.964	6.009
1.018	5.049
1.875	8.572
1.929	7.053
1.929	7.413
2.036	9.093
2.036	9.613
2.143	7.413
2.143	7.933
2.946	8.497
2.946	9.057
2.946	9.377
2.946	10.097
2.946	11.577
3.161	8.578
3.857	9.540
3.857	10.020
4.018	10.461
4.018	11.061
4.018	12.421
4.179	9.142
4.232	10.022
4.929	11.025
4.929	12.105
4.929	12.585
5.089	10.065
5.089	11.505
5.143	8.545
5.250	11.146
5.946	11.989
5.946	12.429
6.000	11.549
6.000	13.069
6.161	9.670
6.429	11.111
6.911	12.113
6.911	12.473
6.911	12.993
6.911	14.593
6.964	13.593
7.125	10.033
7.554	11.155
7.982	13.077
7.982	13.677
8.946	14.001
8.946	14.521
9.000	13.121
9.000	13.561
9.964	14.565
10.018	12.605
10.018	13.485
10.018	14.085
10.018	15.605
10.286	14.086
10.929	13.129
10.982	15.569
10.982	14.089
11.036	13.609
11.946	14.093
12.054	14.533
12.054	15.613
12.911	14.657
13.018	13.097
13.018	13.577
13.929	15.181
14.036	14.101
14.036	14.621
14.946	15.145
14.946	16.625
16.018	15.669
17.036	15.113
17.946	14.597
17.946	16.637
17.946	17.157
18.964	15.601
18.964	16.161
19.929	16.645
19.982	13.605
19.982	15.125
20.143	17.125
20.946	14.729
20.946	15.169
20.946	17.129
21.000	15.649
22.018	16.133
22.018	17.133
22.018	17.613
22.929	16.097
23.946	16.141
23.946	17.141
24.964	16.665
26.089	15.629
26.089	18.109
28.018	15.157
28.018	15.717
28.179	16.678
30.054	17.685];
data.tL_f(:,1) = 365 * (1 + data.tL_f(:,1)); % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'}; label.tL_f = {'time since birth', 'total length', 'female'}; 
temp.tL_f = C2K(21); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'HussCoad2012'};
comment.tL_f = 'Data for females, temp is guessed';
%
data.tL_m = [ ... % age (yr), total length (cm) 
0.964	6.569
1.018	6.009
1.018	7.009
1.018	7.449
1.071	9.089
1.875	10.532
1.982	6.933
1.982	9.053
2.036	8.013
2.036	8.573
2.089	6.493
2.946	8.017
2.946	9.617
3.000	10.537
3.054	9.097
3.054	10.057
3.054	11.537
3.804	9.500
3.964	11.461
4.018	9.981
4.018	10.981
4.179	10.542
4.982	10.465
4.982	10.865
4.982	11.385
5.036	11.945
5.089	10.025
5.946	11.069
5.946	12.029
5.946	12.589
6.000	10.509
6.000	11.549
6.054	10.029
6.964	11.553
7.018	11.113
7.018	12.073
7.018	12.593
7.018	13.033
7.071	13.673
7.929	13.557
7.982	12.037
7.982	13.197
8.036	11.597
8.946	12.641
8.946	13.601
8.946	14.001
9.054	14.601
9.804	13.204
9.964	13.725
10.018	12.605
10.018	15.085
10.929	12.649
12.054	13.093
15.161	13.586
15.964	13.109
16.018	13.509
16.018	14.029
18.000	15.117
19.125	13.561
19.929	14.645
21.000	14.609
22.125	15.173
22.982	14.217
23.946	14.141
24.000	15.141
24.107	15.661
28.982	13.601];
data.tL_m(:,1) = 365 * (1 + data.tL_m(:,1)); % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'}; label.tL_m = {'time since birth', 'total length', 'male'}; 
temp.tL_m = C2K(21); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'HussCoad2012'};
comment.tL_m = 'Data for males,temp is guessed';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

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
D1 = 'males are assumed to differ from females by {p_Am} only ';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  
                                 
%% Facts
F1 = 'Preferred temp 21 C; Depth range from 40-600 m. Data is for NE Atlantic, where is is doubtlessly cooler';
metaData.bibkey.F1 = 'fishbase';
F2 = 'Demersal';
metaData.bibkey.F2 = 'Wiki';
F3 = 'Weight-length: W in g = 0.0193 * (total length in cm)^2.937';
metaData.bibkey.F3 = 'fishbase';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = 'QSYF'; % Cat of Life
metaData.links.id_ITIS = '166320'; % ITIS
metaData.links.id_EoL = '46581439'; % Ency of Life
metaData.links.id_Wiki = 'Capros_aper'; % Wikipedia
metaData.links.id_ADW = 'Capros_aper'; % ADW
metaData.links.id_Taxo = '44767'; % Taxonomicon
metaData.links.id_WoRMS = '127419'; % WoRMS
metaData.links.id_fishbase = 'Capros-aper'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Capros_aper}}';  
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
bibkey = 'HussCoad2012'; type = 'Article'; bib = [ ...  
'author = {K. Hussy and J. O. Coad and E. D. Farrell and L. W. Clausen and M. W. Clarke}, ' ...
'year = {2012}, ' ...
'title = {Sexual dimorphism in size, age, maturation, and growth characteristics of boarfish (\emph{Capros aper}) in the {N}ortheast {A}tlantic}, ' ... 
'journal = {ICES Journal of Marine Science}, ' ...
'volume = {69}, '...
'pages = {1729-1735}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/54}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'aiam'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.aiam.info/index.php/rubriche/riproduzioni-ed-allevamento/2616-riproduzione-in-cattivita-di-capros-aper}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
