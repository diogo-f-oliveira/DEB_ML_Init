function [data, auxData, metaData, txtData, weights] = mydata_Agkistrodon_piscivorus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Viperidae';
metaData.species    = 'Agkistrodon_piscivorus'; 
metaData.species_en = 'Water moccasin'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-dL'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 05 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 19];

%% set data
% zero-variate data

data.ab = 5*30.5;     units.ab = 'd';    label.ab = 'age at puberty for females';     bibkey.ab = 'ADW';
  temp.ab = C2K(24); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1095;     units.tp = 'd';    label.tp = 'time since birth at puberty for females';  bibkey.tp = 'ADW';
  temp.tp = C2K(24); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24.5*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'ADW';   
  temp.am = C2K(24); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 20.5;    units.Lb  = 'cm';  label.Lb  = 'SVL at birth';  bibkey.Lb  = 'Wiki';
  comment.Lb = 'Wiki TL = 22 to 35 cm, with mean 28 cm';
data.Lp  = 48;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'HillBeau2008';
data.Lim  = 137;    units.Lim  = 'cm';  label.Lim  = 'ultimate SVL males';  bibkey.Lim  = 'ADW';
  comment.Lim = 'converted from TL = 188 cm to SVL, using F3; since males are larger than females, the assumetion is that this value concerns a male';

data.Wwb = 16;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'HillBeau2008';
data.Wwim = 4.6e3;   units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of males';  bibkey.Wwim = 'Wiki';
  comment.Wwim = 'since males are larger than females, the assumetion is that this value concerns a male';
  
data.Ri  = 8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(24);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '5 to 9 or 16 young per clutch; HillBeau2008 gives 4.1 eggs per clutch, but small body size of population indicates f<1';

% univariate data
% length-change in length data 
data.LdL_f = [ ... % SVL (cm), change in SVL (cm/d)
20.286	0.148
33.524	0.373
34.000	0.303
36.286	0.284
36.286	0.400
36.286	0.380
37.048	0.428
39.333	0.625
40.095	-0.001
40.095	0.373
41.619	0.337
43.143	0.190
43.714	0.177
45.619	0.127
46.381	0.137
47.238	0.166
48.476	0.468
49.905	0.001
50.000	0.095
50.095	0.079
50.286	0.062
51.905	0.119
51.905	0.042
52.095	-0.023
52.286	0.199
53.048	0.105
53.048	-0.001
53.429	0.192
53.810	0.028
55.238	0.161
55.333	0.045
55.429	0.060
55.714	-0.008
55.810	0.002
55.905	-0.035
55.905	0.018
56.190	0.158
56.286	0.025
56.286	0.040
56.571	0.011
56.667	0.100
56.857	-0.001
57.143	0.038
57.333	0.021
57.619	-0.033
57.619	-0.003
58.000	-0.018
58.095	0.147
59.810	-0.003
59.810	0.023
59.905	-0.016
59.905	0.084
60.571	-0.011
60.952	0.059
63.714	0.011
63.714	0.161
64.476	0.026
65.143	-0.001];
units.LdL_f  = {'cm', 'cm/d'};  label.LdL_f = {'SVL', 'change in SVL', 'female'};  
temp.LdL_f   = C2K(24);  units.temp.LdL_f = 'K'; label.temp.LdL_f = 'temperature';
bibkey.LdL_f = 'HillBeau2008';
comment.LdL_f = 'data for females';
%
data.LdL_m = [ ... % SVL (cm), change in SVL (cm/d)
28.095	0.380
34.571	0.537
38.952	0.177
41.238	0.272
52.000	0.168
52.857	0.175
52.952	0.093
57.333	0.182
57.429	0.093
60.095	0.168
61.048	0.081
61.143	-0.001
61.238	0.028
61.810	0.192
61.810	0.101
61.810	0.024
61.810	0.002
62.190	0.038
62.667	0.004
62.857	0.023
63.048	0.045
63.238	0.002
63.333	0.033
63.333	0.019
64.000	0.137
64.667	0.161
65.619	0.028
66.000	0.173
66.286	-0.011
67.429	0.021
67.429	-0.003
68.190	0.093
68.286	0.287
69.048	-0.081
71.524	0.081
71.714	-0.003
71.714	0.057
72.000	0.011
72.286	0.024
72.857	0.099
73.238	0.106
73.333	-0.027
75.810	0.022
75.905	0.058
77.238	0.026];
units.LdL_m  = {'cm', 'cm/d'};  label.LdL_m = {'SVL', 'change in SVL', 'male'};  
temp.LdL_m   = C2K(24);  units.temp.LdL_m = 'K'; label.temp.LdL_m = 'temperature';
bibkey.LdL_m = 'HillBeau2008';
comment.LdL_m = 'data for males';

% length = weight
data.LW_f = [ ... % SVL (cm), weight (g)
    20.3  13.0
    21.1  17.3
    21.2  16.9
    20.7  14.9
    33.2  30.9
    54.9 218.7
    57.9 299.1
    58.4 226.8];
units.LW_f  = {'cm', 'g'};  label.LW_f = {'SVL', 'weight', 'female'};  
bibkey.LW_f = 'HillBeau2008';
comment.LW_f = 'data for females';
%
data.LW_m = [ ... % SVL (cm), weight (g)
    60.8 284.5
    71.6 547.2];
units.LW_m  = {'cm', 'g'};  label.LW_m = {'SVL', 'weight', 'male'};  
bibkey.LW_m = 'HillBeau2008';
comment.LW_m = 'data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.LdL_f = 3 * weights.LdL_f;
weights.LdL_m = 3 * weights.LdL_m;
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 3 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LdL_f','LdL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Viviparous';
metaData.bibkey.F1 = 'AWD'; 
F2 = 'Facultative parthenogenesis';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'Neonate TL = 28 cm (Wiki), SVL = 20.5 cm (HillBeau2008) so SVL = 0.73*TL, but accuracy is questionable';
metaData.bibkey.F3 = {'Wiki','HillBeau2008'}; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '5TRLF'; % Cat of Life
metaData.links.id_ITIS = '174299'; % ITIS
metaData.links.id_EoL = '46559649'; % Ency of Life
metaData.links.id_Wiki = 'Agkistrodon_piscivorus'; % Wikipedia
metaData.links.id_ADW = 'Agkistrodon_piscivorus'; % ADW
metaData.links.id_Taxo = '50365'; % Taxonomicon
metaData.links.id_WoRMS = '422565'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Agkistrodon&species=piscivorus'; % ReptileDB
metaData.links.id_AnAge = 'Agkistrodon_piscivorus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Agkistrodon_piscivorus}}';
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
bibkey = 'HillBeau2008'; type = 'Article'; bib = [ ... 
'author = {Jacques G. Hill and Steven J. Beaupre}, ' ... 
'year = {2008}, ' ...
'title = {Body Size, Growth, and Reproduction in a Population of Western Cottonmouths (\emph{Agkistrodon piscivorus leucostoma}) in the {O}zark {M}ountains of {N}orthwest {A}rkansas}, ' ...
'journal = {Copeia}, ' ...
'volume = {2008(1)}, ' ...
'pages = {105-114}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Agkistrodon_piscivorus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Agkistrodon_piscivorus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

