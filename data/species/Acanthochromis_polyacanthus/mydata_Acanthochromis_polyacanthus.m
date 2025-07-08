function [data, auxData, metaData, txtData, weights] = mydata_Acanthochromis_polyacanthus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Pomacentridae';
metaData.species    = 'Acanthochromis_polyacanthus'; 
metaData.species_en = 'Spiny chromis'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPW'};
metaData.ecoCode.habitat = {'0iMc', '0iMr'};
metaData.ecoCode.embryo  = {'Mnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 10 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 03];

%% set data
% zero-variate data

data.ab = 16;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Kava2000';   
  temp.ab = C2K(27.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'KingHugh2005';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 6.5;   units.Lp  = 'cm';  label.Lp  = 'standard length at puberty'; bibkey.Lp  = 'Kava2000'; 
data.Li  = 16;   units.Li  = 'cm';  label.Li  = 'ultimate standard length'; bibkey.Li  = 'fishbase';

data.Wwb = 4.4e-3;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Kava2000';
  comment.Wwb = 'based on egg length of 3.7-4.3 mm and width 1.4-1.5 mm: pi/6*0.4*0.145^2'; 
data.Wwp = 9.8;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','Kava2000'};
  comment.Wwi = 'based on 0.03236*Li^3.05, see F1';
data.Wwi = 152;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.03236*Li^3.05, see F1';

data.Ri  = 1100/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Kava2000';   
  temp.Ri = C2K(27.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '250–550 eggs per clutch, 2 clutcher per yr assumed';
  
% uni-variate data
% time-length
data.tL = [ ... % time (yr), standard length (cm)
0.013	0.496
0.014	0.310
0.027	0.155
0.926	7.279
0.928	6.102
0.929	5.730
0.939	7.650
0.940	7.465
0.941	5.947
0.952	8.363
0.966	8.735
0.967	7.186
0.977	10.872
0.981	6.690
0.993	7.000
0.994	6.907
0.995	6.597
0.996	6.504
0.997	5.173
0.998	5.049
1.898	10.345
1.924	10.655
1.927	7.805
1.953	8.735
1.954	8.332
1.955	8.115
1.956	7.991
1.966	9.850
1.967	9.385
1.968	7.527
1.969	6.845
1.978	10.066
1.979	9.757
1.980	9.168
1.981	9.013
1.982	7.712
1.993	9.602
1.994	8.920
2.926	9.942
2.940	9.633
2.941	9.323
2.953	10.345
2.954	9.416
2.955	9.137
2.956	9.013
2.957	8.827
2.958	7.496
2.965	11.491
2.966	10.934
2.967	10.593
2.968	10.407
2.969	10.159
2.970	10.097
2.980	9.788
3.940	10.965
3.942	8.827
3.967	11.181
3.968	10.655
3.969	9.230
3.970	9.075
3.980	10.562
3.981	10.314
3.982	9.912
3.983	9.788
3.984	8.704
3.995	9.633
3.996	9.478
4.009	8.982
4.955	10.841
4.956	10.376
4.968	11.088
4.969	10.283
4.970	9.230
4.981	10.531
4.982	10.128
4.983	9.664
4.984	9.447
4.996	9.912
5.969	10.965
5.983	10.066
5.984	9.850
5.996	10.779
5.997	10.562
5.998	10.252
5.999	9.664
6.037	10.438
6.038	9.261
6.039	9.137
6.040	8.920
6.944	10.376
6.970	10.779
6.971	10.562
6.972	9.416
6.985	9.973
6.986	9.633
6.997	11.212
6.998	10.097
6.999	9.850
7.000	9.726
7.984	10.717
7.985	10.376
7.986	10.221
7.998	11.119
7.999	10.872
8.000	9.602
8.001	9.323
8.011	11.770
8.013	10.035
8.027	9.819
8.959	10.655
8.986	10.965
9.001	9.881
9.014	9.571
10.028	10.624
10.974	11.305
11.056	10.531];
data.tL(:,1) = 365*(data.tL(:,1) + 0); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'standard length'};  
temp.tL    = C2K(27.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'KingHugh2005';
comment.tL = 'data from outer-shelf reefs';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are supposed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.03236*(TL in cm)^3.05';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '64DY4'; % Cat of Life
metaData.links.id_ITIS = '170199'; % ITIS
metaData.links.id_EoL = '46572573'; % Ency of Life
metaData.links.id_Wiki = 'Acanthochromis_polyacanthus'; % Wikipedia
metaData.links.id_ADW = 'Acanthochromis_polyacanthus'; % ADW
metaData.links.id_Taxo = '159877'; % Taxonomicon
metaData.links.id_WoRMS = '279469'; % WoRMS
metaData.links.id_fishbase = 'Acanthochromis-polyacanthus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Acanthochromis_polyacanthus}}';
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
bibkey = 'KingHugh2005'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00338-017-1559-8}, ' ...
'author = {Michael J. Kingsford and Julian M. Hughes}, ' ... 
'year = {2005}, ' ...
'title = {Patterns of growth, mortality, and size of the tropical damselfish \emph{Acanthochromis polyacanthus} across the continental shelf of the {G}reat {B}arrier {R}eef}, ' ...
'journal = {Fish. Bull.}, ' ...
'volume = {103}, ' ...
'pages = {561–573}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kava2000'; type = 'Article'; bib = [ ... 
'author = {Kathryn D. Kavanagh}, ' ... 
'year = {2000}, ' ...
'title = {LARVAL BROODING IN THE MARINE DAMSELFISH \emph{Acanthochromis polyacanthus} ({P}OMACENTRIDAE) IS CORRELATED WITH HIGHLY DIVERGENT MORPHOLOGY, ONTOGENY AND LIFE-HISTORY TRAITS}, ' ...
'journal = {Bulletin of Marine Science}, ' ...
'volume = {66(2)}, ' ...
'pages = {321–337}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Acanthochromis-polyacanthus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
