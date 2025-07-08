function [data, auxData, metaData, txtData, weights] = mydata_Hyla_annectans
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Hylidae';
metaData.species    = 'Hyla_annectans'; 
metaData.species_en = 'Chuanxi tree frog';

metaData.ecoCode.climate = {'Cwa', 'Dwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTh', 'jiTg'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L_fT'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 06 17];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.am = 5*365; units.am = 'd';    label.am = 'life span';                         bibkey.am = 'LiaoLua2010';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 1.15;  units.Lj  = 'cm';  label.Lj  = 'SVL at metam';                    bibkey.Lj  = 'LiaoLua2010';
data.Lp  = 3.7;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females';       bibkey.Lp  = 'LiaoLua2010';
data.Lpm  = 3.15;  units.Lpm  = 'cm';  label.Lpm  = 'SVL at puberty for males';     bibkey.Lpm  = 'LiaoLua2010';
data.Li  = 4.1;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';         bibkey.Li  = 'LiaoLua2010';
data.Lim  = 3.7; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';          bibkey.Lim  = 'LiaoLua2010';

data.Wwb = 9.8e-4; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';              bibkey.Wwb = 'guess';
  comment.Wwb = 'based on Hyla eximia';
data.Wwi = 5.75; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based on length-weight of Hyla eximia: (4.1/3.75)^3*4.4';
data.Wwim = 4.22; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'guess';
  comment.Wwim = 'based on length-weight of Hyla eximia: (3.7/3.75)^3*4.4';

data.Ri  = 1476/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 4.5 cm SVL';    bibkey.Ri  = 'guess';   
  temp.Ri  = C2K(20.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Hyla eximia';

% uni-variate data
% time-length
data.tL_fl = [ ... % time since birth (yr), SVL (cm)
0.192	1.168 % metam
0.990	2.994
2.011	3.810
2.036	3.665
2.993	3.824
3.006	3.956
3.018	3.733
3.976	3.892
3.976	3.984
4.001	4.063];
data.tL_fl(:,1) = 365 * data.tL_fl(:,1);
units.tL_fl  = {'d', 'cm'};  label.tL_fl = {'time since birth', 'SVL', 'female'};  
temp.tL_fl   = C2K(18);  units.temp.tL_fl = 'K'; label.temp.tL_fl = 'temperature';
bibkey.tL_fl = 'LiaoLua2010';
comment.tL_fl = 'data for females at 800 m elevation; 10 to 25 C';
%
data.tL_ml = [ ... % time since birth (yr), SVL (cm)
0.192	1.168 % metam
1.002	2.955
1.997	2.996
1.997	3.075
1.997	3.180
2.010	3.337
2.992	3.352
2.992	3.391];
data.tL_ml(:,1) = 365 * data.tL_ml(:,1);
units.tL_ml  = {'d', 'cm'};  label.tL_ml = {'time since birth', 'SVL', 'male'};  
temp.tL_ml   = C2K(18);  units.temp.tL_ml = 'K'; label.temp.tL_ml = 'temperature';
bibkey.tL_ml = 'LiaoLua2010';
comment.tL_ml = 'data for males at 800 m elevation; 10 to 25 C';
%
data.tL_fh = [ ... % time since birth (yr), SVL (cm)
0.167	1.164 % metam
1.990	3.919
2.999	4.040
3.000	4.199
3.012	3.934
3.996	4.240
3.997	4.333
4.993	4.295];
data.tL_fh(:,1) = 365 * data.tL_fh(:,1);
units.tL_fh  = {'d', 'cm'};  label.tL_fh = {'time since birth', 'SVL', 'female'};  
temp.tL_fh   = C2K(13);  units.temp.tL_fh = 'K'; label.temp.tL_fh = 'temperature';
bibkey.tL_fh = 'LiaoLua2010';
comment.tL_fh = 'data for females at 1700 m elevation; 2 to 20 C';
%
data.tL_mh = [ ... % time since birth (yr), SVL (cm)
0.167	1.178 % metam
0.179	1.138
1.975	3.073
1.976	3.178
1.976	3.311
2.985	3.313
2.998	3.458
2.998	3.537
3.982	3.526
3.982	3.672];
data.tL_mh(:,1) = 365 * data.tL_mh(:,1);
units.tL_mh  = {'d', 'cm'};  label.tL_mh = {'time since birth', 'SVL', 'male'};  
temp.tL_mh   = C2K(13);  units.temp.tL_mh = 'K'; label.temp.tL_mh = 'temperature';
bibkey.tL_mh = 'LiaoLua2010';
comment.tL_mh = 'data for males at 1700 m elevation; 2 to 20 C';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fh = 3 * weights.tL_fh;
weights.tL_mh = 3 * weights.tL_mh;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_fh','tL_mh'}; subtitle1 = {'Data for females, males, at 1700 m'};
set2 = {'tL_fl','tL_ml'}; subtitle2 = {'Data for females, males, at 800 m'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3NCKQ'; % Cat of Life
metaData.links.id_ITIS = '662421'; % ITIS
metaData.links.id_EoL = '320005'; % Ency of Life
metaData.links.id_Wiki = 'Hyla_annectans'; % Wikipedia
metaData.links.id_ADW = 'Hyla_annectans'; % ADW
metaData.links.id_Taxo = '47846'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Hyla+annectans'; % AmphibiaWeb

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyla_eximia}}';
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
bibkey = 'LiaoLua2010'; type = 'Article'; bib = [ ... 
'author = {Wen Bo Liao and Xin Lua}, ' ... 
'year = {2010}, ' ...
'title = {Age structure and body size of the {C}huanxi Tree Frog \emph{Hyla annectans chuanxiensis} from two different elevations in {S}ichuan ({C}hina)}, ' ...
'journal = {Zoologischer Anzeiger}, ' ...
'volume = {248}, ' ...
'pages = {255-263}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/cgi/amphib_query?rel-common_name=like&where-scientific_name=Hyla+eximia}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hyla_arborea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

