function [data, auxData, metaData, txtData, weights] = mydata_Coluber_constrictor
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Colubridae';
metaData.species    = 'Coluber_constrictor'; 
metaData.species_en = 'Eastern racer'; 

metaData.ecoCode.climate = {'B','Cs','Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTg','0iFm'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 43;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'Fitc1963';
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 21.4;    units.Lb  = 'cm';  label.Lb  = 'SVL at birth';      bibkey.Lb  = 'Fitc1963';
data.Lp  = 80;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';      bibkey.Lp  = 'Fitc1963';
  comment.Lp = 'based on tL data for tp = 2.5 yr';
data.Li  = 147;    units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = {'ADW','Fitc1963'};
  comment.Li = 'ADW: 190 cm total length, whih corresponds with 190*890/(890+257) SVL, Fitc1963';

data.Wwb = 4.16;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'Fitc1963';
data.Wwi = 1593;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'AnAge';
  
data.Ri  = 3.6/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';          bibkey.Ri  = 'Beau1995';   
  temp.Ri = C2K(30);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-32 eggs per clutch, 1 clutch per yr';

% univariate data
% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.216	21.905
0.412	32.857
1.006	56.905
1.224	60.952
1.670	64.524
2.174	74.762
2.702	80.952
3.188	84.048
3.674	87.381
4.173	89.048
4.699	91.905
5.170	93.333
5.670	96.667
6.194	96.905
6.678	97.143
7.204	100.000
7.716	101.429
8.201	102.857
8.726	104.762];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f   = C2K(30);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Fitc1963'; comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.216	22.143
0.574	34.286
1.196	59.048
1.710	63.810
2.061	67.381
2.575	71.190
3.047	74.524
3.506	76.429
4.045	79.048
4.503	80.952
5.015	82.143
5.540	82.857
6.038	84.048
6.522	84.762
7.007	86.667
7.559	87.619
8.069	87.381
8.581	89.048
9.052	88.810
9.577	90.476
10.075	91.429];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m   = C2K(30);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Fitc1963'; comment.tL_m = 'Data for males';

% time-weight
data.tW_f = [ ... % time since birth (yr), weight (g)
0.212	11.408
1.208	61.066
1.666	85.034
2.317	134.046
2.956	150.668
3.461	182.601
3.983	211.129
4.380	191.333
5.002	210.224
5.391	249.517
5.950	244.530
6.210	270.726
7.100	244.223
7.308	294.839];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d
units.tW_f  = {'d', 'g'};  label.tW_f = {'time since birth', 'weight', 'female'};  
temp.tW_f   = C2K(30);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Fitc1963'; comment.tW_f = 'Data for females';
%
data.tW_m = [ ... % time since birth (yr), weight (g)
0.098	6.269
0.228	13.116
1.094	57.063
1.503	68.520
2.221	106.751
2.813	103.476
3.317	147.341
3.893	141.222
4.202	164.019
4.876	154.514
5.286	164.834
5.892	176.335
6.910	178.839
7.974	210.899];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
units.tW_m  = {'d', 'g'};  label.tW_m = {'time since birth', 'weight', 'male'};  
temp.tW_m   = C2K(30);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Fitc1963'; comment.tW_m = 'Data for males';


%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;
weights.Lb = 3 * weights.Lb;
weights.Li = 5 * weights.Li;

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
set2 = {'tW_f','tW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '5ZP35'; % Cat of Life
metaData.links.id_ITIS = '174169'; % ITIS
metaData.links.id_EoL = '2922433'; % Ency of Life
metaData.links.id_Wiki = 'Coluber_constrictor'; % Wikipedia
metaData.links.id_ADW = 'Coluber_constrictor'; % ADW
metaData.links.id_Taxo = '49958'; % Taxonomicon
metaData.links.id_WoRMS = '1498256'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Coluber&species=constrictor'; % ReptileDB
metaData.links.id_AnAge = 'Coluber_constrictor'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Coluber_constrictor}}';
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
bibkey = 'Fitc1963'; type = 'phdthesis'; bib = [ ... 
'author = {Henry S. Fitch}, ' ... 
'year = {1963}, ' ...
'title = {Natural History of the Racer \emph{Coluber constrictor}}, ' ...
'school = {University of Kansas, Lawrence}, ' ...
'howpublished = {\url{https://www.gutenberg.org/files/42676/42676-h/42676-h.htm}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Coluber_constrictor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Coluber_constrictor/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'retileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{http://reptile-database.reptarium.cz/species?genus=Coluber&species=constrictor}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

