function [data, auxData, metaData, txtData, weights] = mydata_Dipturus_laevis

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Rajiformes'; 
metaData.family     = 'Rajidae';
metaData.species    = 'Dipturus_laevis'; 
metaData.species_en = 'Barndoor skate'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANW'};
metaData.ecoCode.habitat = {'0iMcd'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 28];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.author_mod_1  = {'Bas Kooijman'};        
metaData.date_mod_1    = [2024 10 26];                           
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_1 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 26];

%% set data
% zero-variate data;
data.ab = 270; units.ab = 'd';    label.ab = 'age at birth';               bibkey.ab = 'guess';   
  temp.ab = C2K(7.3); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'GedaDuPa2005';   
  temp.am = C2K(7.3); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 18.5;   units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'ADW';
  comment.Lb = 'TL 18-19 cm';
data.Lp  = 100;   units.Lp  = 'cm';  label.Lp  = 'pelvic lengtb at puberty for females';   bibkey.Lp  = 'fishbase';
data.Li  = 163; units.Li  = 'cm';  label.Li  = 'ultimate pelvic for females';   bibkey.Li  = 'fishbase';

data.Wwi = 18e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';     bibkey.Wwi = 'fishbase';

data.Ri  = 58/365; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(7.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kappa = 0.8';

% uni-variate data at f
data.tL = [ ... % time since birth (yr), total length (cm)
0.009	40.099
0.009	37.637
0.011	21.104
0.023	33.063
0.023	24.621
0.048	30.247
0.049	27.785
0.995	41.795
0.995	39.684
0.995	36.518
0.996	35.111
1.006	55.864
1.007	51.995
1.007	47.774
1.008	44.608
1.992	67.058
1.992	62.485
1.993	51.932
1.993	48.414
2.005	59.670
2.005	55.801
2.989	78.250
2.991	64.180
2.991	60.310
3.001	92.672
3.001	89.857
3.002	83.526
3.003	69.104
3.004	57.144
3.986	103.161
3.987	91.201
3.987	88.739
3.998	107.733
3.999	100.698
3.999	98.236
3.999	94.366
4.000	85.221
4.001	73.964
4.002	70.799
4.002	68.336
4.984	109.781
4.999	85.860
4.999	81.991
5.000	79.177
5.011	95.357
5.011	92.895
5.011	90.432
5.022	113.648
5.960	80.874
5.969	120.622
5.983	106.199
5.984	101.978
5.984	97.405
5.984	93.888
5.995	122.028
5.995	119.566
5.995	112.882
5.996	109.716
5.996	108.309
5.997	91.073
6.943	113.877
6.955	125.484
6.980	128.296
6.981	122.668
6.981	119.502
6.981	116.337
6.982	104.025
8.018	126.471
8.018	124.361
8.018	121.547
8.965	127.114
8.979	113.395
8.990	130.278
10.003	122.475
10.975	128.393
10.976	126.634
11.001	131.909];
data.tL(:,1) = 365 * (0.8 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(7.3); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GedaDuPa2005';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Wwi = 5 * weights.Wwi;
weights.Li = 10 * weights.Li;
weights.Lb = 5 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'mod_1: p_M reduced';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '36R3W'; % Cat of Life
metaData.links.id_ITIS = '564139'; % ITIS
metaData.links.id_EoL = '46560472'; % Ency of Life
metaData.links.id_Wiki = 'Dipturus_laevis'; % Wikipedia
metaData.links.id_ADW = 'Dipturus_laevis'; % ADW
metaData.links.id_Taxo = '173277'; % Taxonomicon
metaData.links.id_WoRMS = '158548'; % WoRMS
metaData.links.id_fishbase = 'Dipturus-laevis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dipturus_laevis}}'; 
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
bibkey = 'GedaDuPa2005'; type = 'Article'; bib = [ ... 
'doi = {10.1080/00288330.2001.9517045}, ' ...
'author = {Todd Gedamke and William D. DuPaul and John A. Musick}, ' ...
'year = {2005}, ' ...
'title  = {Observations on the life history of the barndoor skate, \emph{Dipturus laevis}, on {G}eorges {B}ank ({W}estern {N}orth {A}tlantic)}, ' ...
'journal = {VIMS Articles}, ' ...
'volume = {1763}, ' ...
'howpublished = {\url{https://scholarworks.wm.edu/vimsarticles/1763}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Dipturus-laevis.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Dipturus_laevis/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

