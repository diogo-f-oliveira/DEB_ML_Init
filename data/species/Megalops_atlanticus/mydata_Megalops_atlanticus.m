function [data, auxData, metaData, txtData, weights] = mydata_Megalops_atlanticus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Elopiformes'; 
metaData.family     = 'Megalopidae';
metaData.species    = 'Megalops_atlanticus'; 
metaData.species_en = 'Atlantic tarpon'; 

metaData.ecoCode.climate = {'MA', 'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMr', '0iMcp'};
metaData.ecoCode.embryo  = {'Fp', 'Mp'};
metaData.ecoCode.migrate = {'Ma'};
metaData.ecoCode.food    = {'bpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Ls'; 'Lj'; 'L_t'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2013 04 06];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 10 15]; 

%% set data
% zero-variate data;
data.ab = 2.5;   units.ab = 'd';    label.ab = 'age at birth';                            bibkey.ab = 'ADW'; % actually hatch    
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = 'temp based on Wiki: preferred temp 22-28C'; 
data.as = data.ab+2.5*30.5;   units.as = 'd';    label.as = 'age at metamorphisis to stage 2'; bibkey.as = 'flmnh';    
  temp.as = C2K(25); units.temp.as = 'K'; label.temp.as = 'temperature';
data.aj = data.as + 22.5;  units.aj = 'd';    label.aj = 'age at metamorphisis to stage 3';    bibkey.aj = 'flmnh';
  temp.aj = C2K(25);  units.temp.aj = 'K'; label.temp.aj = 'temperature';
data.ap = 3102;  units.ap = 'd';    label.ap = 'age at puberty';                          bibkey.ap = 'AnAge';
  temp.ap = C2K(25); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = 'for female, 3650 d for male';
data.am = 55*365;units.am = 'd';    label.am = 'life span';                               bibkey.am = 'AnAge';   
  temp.am = C2K(25); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.6;   units.Lb  = 'cm';  label.Lb  = 'standard length at birth';              bibkey.Lb  = 'flmnh';
data.Ls  = 2.8;   units.Ls  = 'cm';  label.Ls  = 'standard length at metamorphosis to stage 2'; bibkey.Ls  = 'flmnh';
data.Lj  = 1.4;   units.Lj  = 'cm';  label.Lj  = 'standard length at metamorphosis to stage 3'; bibkey.Lj  = 'flmnh';
data.L52  = 4;    units.L52  = 'cm'; label.L52  = 'standard length at juvenile stage 7 till 8 weeks after aj'; bibkey.L52  = 'flmnh';
  temp.L52 = C2K(25); units.temp.L52 = 'K'; label.temp.L52 = 'temperature';
data.Lp  = 75;    units.Lp  = 'cm';  label.Lp  = 'standard length at birth';              bibkey.Lp  = 'Wiki'; % 75-125 cm
data.Li  = 250;   units.Li  = 'cm';  label.Li  = 'ultimate standard length';              bibkey.Li  = 'Wiki';

data.Wwi = 161e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';                   bibkey.Wwi = 'Wiki'; 

data.Ri  = 12e6/365; units.Ri  = '#/d';label.Ri  = 'reprod rate at Lw = 200 cm';          bibkey.Ri  = 'flmnh';   
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL_f = [ ... age (yr), fork length (cm) for females
 0.096	37.269
 1.068	44.581
 2.150	60.786
 3.008	62.437
 3.865	64.896
 4.941	84.333
 6.048	84.378
 6.988	112.699
 8.005	90.922
 8.966	105.506
 9.907	133.019
11.126	140.341
12.104	143.613
13.061	161.429
14.063	149.348
15.035	156.660
16.135	160.745
16.982	169.668
17.991	153.547
19.204	164.101
20.196	158.485
20.792	170.630
21.916	159.363
23.008	169.104
23.873	165.906
24.984	163.527
25.713	169.213
27.059	173.308
27.919	173.342
29.026	173.387
29.993	183.931
31.110	177.512
31.840	182.390
32.833	175.965
33.936	178.434
34.937	167.161
35.899	180.938
36.878	184.209
37.998	175.366
38.967	185.102
39.831	182.713
41.063	181.146
41.919	184.413
42.672	173.939
43.866	197.421
45.865	176.492
47.959	174.152
48.955	166.112
49.917	179.888
54.095	181.673
55.164	205.958];
data.tL_f(:,1) = 365 * (1 + data.tL_f(:,1)); % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'time since birth', 'fork length', 'female'};  
  temp.tL_f = C2K(25); units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'CrabCyr1995';
comment.tL_f = ['FL = 10.8404 + 1.40423 * SL: from standard length to fork length in mm; ', ...
  'log_10 WT = -7.9156 + 2.9838 * log_10 FL: from FL in mm to wet weight in kg; ', ...
  'Bas Kooijman: hard to believe that the tail affects fork length that much'];
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... age (yr), fork length (cm) for males
0.000	31.823
0.938	44.070
2.032	56.318
3.007	64.494
4.220	80.814
4.941	97.115
5.929	92.273
7.052	76.861
7.898	90.726
10.176	147.768
11.048	136.414
12.169	122.629
12.898	130.794
14.240	140.612
14.973	145.523
16.085	139.873
16.941	144.789
18.048	144.834
19.154	144.879
19.893	144.096
20.997	146.581
21.985	141.740
22.962	148.288
24.069	147.520
24.922	155.690
26.019	164.684
27.016	151.707
27.762	143.602
28.971	163.990
31.080	145.364
31.925	160.856
32.794	151.943
33.658	148.723
35.862	157.762
36.985	142.350
37.841	146.453
38.945	148.938
40.916	144.951
42.735	170.245];
data.tL_m(:,1) = 365 * (1 + data.tL_m(:,1)); % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'time since birth', 'fork length', 'male'};  
  temp.tL_m = C2K(25); units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'CrabCyr1995';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 10 * weights.psd.p_M;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'All larval forms are given the same shape coefficient, del_M, due to lack of data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = [ ...
    'wiki: The tarpon feeds almost exclusively on schooling fish and occasionally crabs.',...
    'It is capable of filling its swim bladder with air, like a primitive   lung. '];
metaData.bibkey.F1 = 'Wiki';
F2 = [ ...
    'The first stage, the leptocephalus stage, or stage one, is completed after 20-30 days.', ... 
  'It takes place in clear, warm oceanic waters, usually within 10-20 m of the surface.',...
  'The leptocephalus shrinks as it develops into a larva; the most shrunken larva, stage two, develops by day 70.',... 
  'This is due to a negative growth phase followed by a sluggish growth phase.',... 
  'By day 70, the juvenile growth phase, stage three, begins and the fish begins to rapidly grow until it reaches sexual maturity.'];
metaData.bibkey.F2 = 'Wiki';
F3 = [ ...
    'Stage-one larvae are usually found in clear, warm, oceanic waters, relatively close to the surface.']; 
metaData.bibkey.F3 = 'Wiki';
F4 = [ ...
    'Stage-two and -three larvae are found in salt marshes, tidal pools, creeks, and rivers.',... 
  'The habitats are characteristically warm, shallow, dark bodies of water with sandy mud bottoms.'];
metaData.bibkey.F4 = 'Wiki';
F5 = [...
    'Tarpons commonly ascend rivers into freshwater. ',...
  'As they progress from the juvenile stage to adulthood, they move back to the open waters of the ocean, though many remain in freshwater habitats.'];
metaData.bibkey.F5 = 'Wiki';
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4,'F5',F5);

%% Links
metaData.links.id_CoL = '3YVJ9'; % Cat of Life
metaData.links.id_ITIS = '161116'; % ITIS
metaData.links.id_EoL = '46561200'; % Ency of Life
metaData.links.id_Wiki = 'Megalops_atlanticus'; % Wikipedia
metaData.links.id_ADW = 'Megalops_atlanticus'; % ADW
metaData.links.id_Taxo = '92883'; % Taxonomicon
metaData.links.id_WoRMS = '126430'; % WoRMS
metaData.links.id_fishbase = 'Megalops-atlanticus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Megalops_atlanticus}}';  
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
bibkey = 'CrabCyr1995'; type = 'Article'; bib = [ ...  
'author = {Crabtree, R. E. and Cyr, E. and Dean, J. M.}, ' ...
'year = {1995}, ' ...
'title  = {Age and growth of tarpon, \emph{Megalops atlanticus}, from South {F}lorida waters.}, ' ...
'journal = {Fishery Bulletin}, ' ...
'volume = {93}, ' ...
'pages = {619--628}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'flmnh'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.flmnh.ufl.edu/fish/Gallery/Descript/Tarpon/Tarpon.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Megalops-atlanticus.html}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Megalops_atlanticus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.ummz.umich.edu/accounts/Megalops_atlanticus/}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
