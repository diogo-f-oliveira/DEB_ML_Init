function [data, auxData, metaData, txtData, weights] = mydata_Mustelus_henlei
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Triakidae';
metaData.species    = 'Mustelus_henlei'; 
metaData.species_en = 'Brown smooth-hound'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMd'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15.4); % K, body temperature
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 23];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data;
data.ab = 9*30.5;    units.ab = 'd';    label.ab = 'age at birth';          bibkey.ab = 'guess';   
  temp.ab = C2K(15.4); units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.am = 13*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'YudiCail1990';   
  temp.am = C2K(15.4); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 20;     units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'YudiCail1990';
  comment.Lb = 'fishbase: 20-32 cm';
data.Lp = 56;  units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'YudiCail1990';
  comment.Lp = '51-63 cm';
data.Lpm = 59; units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'YudiCail1990';
  comment.Lpm = '52-66 cm';
data.Li  = 100;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'YudiCail1990';
data.Lim  = 79.5; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'YudiCail1990';

data.Wwi  = 4.37e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = {'fishbase','YudiCail1990'};
  comment.Wwi = 'based on 0.00240*Li^3.13, see F3';
data.Wwim  = 2.13e3;  units.Wwim  = 'g';    label.Wwim  = 'ultimate wet weight for males';  bibkey.Wwim  = {'fishbase','YudiCail1990'};
  comment.Wwim = 'based on 0.00240*Lim^3.13, see F3';

data.Ri  = 4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(15.4); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-5 pups per litter, 1 litter per  yr assumed';
    
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	26.166
0.983	33.521
1.963	60.451
2.002	52.569
2.975	56.872
2.978	65.261
2.978	67.041
4.032	63.970
4.033	65.749
4.076	67.782
4.076	69.053
4.987	77.425
4.987	79.714
5.009	82.001
5.028	75.645
5.979	79.186
5.999	76.643
6.065	83.252
6.975	90.098
6.988	67.980
6.994	83.742
6.997	92.386
7.964	83.469
7.985	81.435
7.986	84.994
8.005	79.400
8.029	86.773
8.999	83.449
8.999	85.737
10.037	95.378
10.986	94.342
11.006	91.545
12.948	92.524
12.972	99.896];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
n=size(data.tL_f,1); for i=2:n; if data.tL_f(i,1)<=data.tL_f(i-1,1); data.tL_f(i,1)=data.tL_f(i-1,1)+1e-3; end; end
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f = C2K(15.4);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'YudiCail1990';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
0.000	28.455
0.982	31.233
2.025	56.127
2.025	57.653
2.042	45.703
2.934	60.177
2.934	62.211
4.076	67.020
4.076	69.308
4.966	79.206
4.985	72.341
4.986	74.375
5.004	65.476
5.979	78.677
6.040	72.320
6.971	79.166];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
n=size(data.tL_m,1); for i=2:n; if data.tL_m(i,1)<=data.tL_m(i-1,1); data.tL_m(i,1)=data.tL_m(i-1,1)+1e-3; end; end
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m = C2K(15.4);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'YudiCail1990';
comment.tL_m = 'Data for males';

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
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'demersal; depth range 0 - 400 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.00240 * (TL in cm)^3.13';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '44R28'; % Cat of Life
metaData.links.id_ITIS = '160236'; % ITIS
metaData.links.id_EoL = '46559995'; % Ency of Life
metaData.links.id_Wiki = 'Mustelus_henlei'; % Wikipedia
metaData.links.id_ADW = 'Mustelus_henlei'; % ADW
metaData.links.id_Taxo = '106426'; % Taxonomicon
metaData.links.id_WoRMS = '271386'; % WoRMS
metaData.links.id_fishbase = 'Mustelus-henlei'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mustelus_henlei}}';  
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
bibkey = 'YudiCail1990'; type = 'article'; bib = [ ... 
'author = {Katherine G. Yudin and Gregor M. Cailliet}, ' ...
'year = {1990}, ' ...
'title  = {Age and Growth of the Gray Smoothhound, \emph{Mustelus californicus}, and the Brown Smoothhound, \emph{M. henlei}, Sharks from Central {C}alifornia}, ' ...
'journal = {Copeia}, ' ...
'volume = {1990(1)}, ' ...
'pages = {191-204}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Mustelus-henlei.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

