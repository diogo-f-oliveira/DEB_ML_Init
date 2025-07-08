function [data, auxData, metaData, txtData, weights] = mydata_Engystomops_pustulosus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Leptodactylidae';
metaData.species    = 'Engystomops_pustulosus'; 
metaData.species_en = 'Tungara frog'; 

metaData.ecoCode.climate = {'Am', 'Af'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Tnp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'0iCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L','t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 05 28];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 28]; 

%% set data
% zero-variate data

data.am = 4*365;units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 2.0;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'guess';
data.Li  = 3.5;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'Wiki';
data.Lim = 3.0;  units.Lim = 'cm';  label.Lim = 'ultimate SVL for males';  bibkey.Lim  = 'EoL';

data.Wwb = 2.24e-2; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3.5 mm: pi/6*0.35^3';
data.Wwim = 1.71;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'EoL';

data.Ri  = 100/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri  = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
% time-length
data.tL = [ ... % time (d), SVL (cm)
1.107	1.047
5.030	1.089
8.048	1.101
12.072	1.135
15.996	1.162
19.014	1.194
22.032	1.288
26.157	1.344
28.873	1.374
32.897	1.403
36.016	1.428
39.940	1.460
43.058	1.507
46.982	1.529
50.000	1.551
54.024	1.570
56.841	1.644];
units.tL   = {'d', 'cm'};  label.tL = {'time', 'SVL'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'WalsDown2005';
comment.tL = 'shelter available'; 

% time-weight
data.tW = [ ... % time (d), wet weight (g)
0.508	0.162
4.573	0.163
7.825	0.166
11.585	0.184
15.752	0.210
19.106	0.242
21.951	0.296
26.016	0.327
28.760	0.361
32.927	0.378
35.772	0.411
39.939	0.436
43.089	0.469
47.154	0.508
49.898	0.566
53.963	0.550
57.012	0.613];
units.tW   = {'d', 'g'};  label.tW = {'time', 'wet weight'};  
temp.tW    = C2K(27);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'WalsDown2005';
comment.tW = 'shelter available'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.tW = 3 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Nests in foam'; 
metaData.bibkey.F1 = 'amphibiaweb';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '39TTY'; % Cat of Life
metaData.links.id_ITIS = '774697'; % ITIS
metaData.links.id_EoL = '331284'; % Ency of Life
metaData.links.id_Wiki = 'Engystomops_pustulosus'; % Wikipedia
metaData.links.id_ADW = 'Engystomops_pustulosus'; % ADW
metaData.links.id_Taxo = '994912'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Engystomops+pustulosus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Engystomops_pustulosus}}';
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
bibkey = 'WalsDown2005'; type = 'Article'; bib = [ ...  
'author = {Patrick T. Walsh and J. Roger Downie}, ' ...
'year = {2005}, ' ...
'title  = {THE EFFECTS OF SHELTER AVAILABILITY AND SUBSTRATE QUALITY ON BEHAVIOUR AND POST-METAMORPHIC GROWTH IN THREE SPECIES OF ANURANS: IMPLICATIONS FOR CAPTIVE BREEDING}, ' ...
'journal = {Herpetological Journal}, ' ...
'volme = {15}, ' ...
'pages = {245-255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?where-genus=Engystomops&where-species=pustulosus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/331284}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

