function [data, auxData, metaData, txtData, weights] = mydata_Cynoscion_albus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Sciaeniformes'; 
metaData.family     = 'Sciaenidae';
metaData.species    = 'Cynoscion_albus'; 
metaData.species_en = 'Whitefin weakfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', '0jMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24.3); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 03];

%% set data
% zero-variate data

data.am = 18*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(24.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 72;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';
data.Li  = 130;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 2e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'Bort2003';
  comment.Wwb = 'based on egg diameter of 0.72 mm: pi/6*0.072^3';
data.Wwp = 3.9e3;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty for females';    bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'Based on 0.00813*Lp^3.06, see F1';
data.Wwi = 23.9e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00813*Li^3.06, see F1';

data.Ri = 11e6/365;  units.Ri = '#/d';  label.Ri = 'reprod rate';  bibkey.Ri = 'guess';
  temp.Ri = C2K(24.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on Cynoscion_nebulosus';
 
% uni-variate data
% time-length
data.tL = [ ... % yr class (yr), standard length (cm)
1.946	38.649
2.039	36.785
2.042	34.266
2.950	43.340
2.957	38.617
3.094	36.136
3.945	54.642
3.959	44.252
3.977	47.407
3.981	44.888
3.996	50.561
4.859	59.937
4.888	54.591
4.937	51.770
4.954	55.554
4.958	52.406
4.961	50.202
4.980	53.042
4.997	57.141
5.068	54.326
5.920	71.888
5.928	65.906
5.970	68.122
5.994	66.869
6.021	63.412
6.058	69.721
6.087	64.690
6.091	61.542
6.918	80.986
6.934	69.337
6.967	78.480
6.994	74.393
6.994	74.393
7.041	72.831
7.044	70.942
7.048	68.109
7.064	72.523
7.071	67.170
7.104	76.313
7.988	86.955
8.060	83.510
8.060	83.510
8.062	81.936
8.064	80.677
8.065	79.732
8.074	89.498
8.089	78.164
9.028	80.947
9.033	94.176
9.048	83.157
9.058	92.294
9.062	89.775
9.062	89.460
9.066	86.312
9.089	85.688
10.018	96.027
10.023	92.249
10.043	94.144
10.048	90.996
10.076	86.594
11.013	90.636
11.030	94.735
11.094	97.273
11.123	92.557
12.020	92.808
12.060	96.913
12.061	95.654
12.097	102.908
13.028	111.988
13.037	104.431
13.046	97.820
13.048	96.245
13.050	94.671
13.086	101.295
13.996	109.739
14.025	104.708
14.050	102.510
14.088	107.875
14.985	108.441
15.038	102.157
15.047	112.238
15.078	105.947
16.050	100.235
17.025	110.272
18.083	107.734];
data.tL(:,1) = (0+data.tL(:,1))*365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3; end; end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length', 'juvenile'};  
temp.tL    = C2K(24.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MugV1993';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'tL_f','tL','tL_m'}; subtitle1 = {'Data for females, juveniles, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: Ww in g = 0.00813*(TL in cm)^3.06';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6BVLF'; % Cat of Life
metaData.links.id_ITIS = '169254'; % ITIS
metaData.links.id_EoL = '46578979'; % Ency of Life
metaData.links.id_Wiki = 'Cynoscion'; % Wikipedia
metaData.links.id_ADW = 'Cynoscion_albus'; % ADW
metaData.links.id_Taxo = '172624'; % Taxonomicon
metaData.links.id_WoRMS = '276075'; % WoRMS
metaData.links.id_fishbase = 'Cynoscion-albus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cynoscion}}';
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
bibkey = 'MugV1993'; type = 'phdthesis'; bib = [ ... 
'author = {Moises Mug-Villanueva}, ' ... 
'year = {1993}, ' ...
'title = {Age Determination of Corvina Reina (\emph{Cynoscion albus}) in the {G}ulf of {N}icoya, Based on Otolith Surface Readings and Microincrement Analysis}, ' ...
'school = {Oregon Stae University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Cynoscion-albus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

