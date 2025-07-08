function [data, auxData, metaData, txtData, weights] = mydata_Trachurus_lathami

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Carangiformes'; 
metaData.family     = 'Carangidae';
metaData.species    = 'Trachurus_lathami'; 
metaData.species_en = 'Rough scad'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAW'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2025 01 20];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2025 01 20];

%% set data
% zero-variate data

data.ab = 10;   units.ab = 'd';    label.ab = 'time at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(22.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 16 * 365;     units.am = 'd';      label.am = 'life span';        bibkey.am = 'guess';   
  temp.am = C2K(22.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 12;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 40;   units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'fishbase';

data.Wwb = 5.23e-4;   units.Wwb = 'g';    label.Wwb = 'wet weight at birth'; bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1 mm: pi/6*0.1^3';
data.Wwp = 15.3;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00955*Lp^2.97, see F1';
data.Wwi = 547; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00955*Li^2.97, see F1; max published weight 500 g';

data.Ri  = 9.5e4/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(22.5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Trachurus_picturatus: 302358*547/1742';
 
% uni-variate data
% time-length
data.tL =	[ % time since birth (yr), total length (cm)
0.011	6.315
0.012	3.464
0.013	4.629
0.014	4.382
0.041	4.084
0.916	8.078
0.930	7.235
0.944	8.549
0.944	7.657
0.944	6.839
0.957	10.037
0.957	8.921
0.957	8.748
0.971	9.591
0.971	8.202
0.971	8.004
0.971	7.781
0.985	7.459
0.998	9.764
0.998	8.376
0.998	7.062
1.012	9.393
1.012	6.616
1.012	6.417
1.026	9.095
1.053	7.087
2.954	14.530
2.968	12.993
2.968	13.464
2.968	14.357
2.982	14.010
2.982	15.299
2.982	15.770
2.995	12.348
2.995	14.208
2.995	14.927
3.009	13.191
3.009	14.729
3.023	15.547
3.023	16.117
3.967	16.863
3.967	15.996
3.967	13.516
3.980	18.029
3.980	17.583
3.980	16.169
3.980	15.797
3.980	15.227
3.994	17.310
3.994	17.111
3.994	15.500
4.008	16.343
4.021	13.839
4.035	16.665
4.965	18.155
4.965	17.660
4.979	18.800
5.006	17.908
5.006	17.238
5.964	18.654
5.991	18.307
6.976	19.078
7.017	19.376
7.988	19.329
8.002	19.627
8.015	19.032];
data.tL(:,1) = 365 * (0.6+data.tL(:,1)); % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1); data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(22.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'RuasSant2017';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lp = 3 * weights.Lp;
weights.Wwi = 0 * weights.Wwi;
weights.Wwp = 0 * weights.Wwp;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.comment = comment;
txtData.bibkey = bibkey;

% %% Group plots
% set1 = {'tL_N','tL_S'}; subtitle1 = {'Data from northern, southern region'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00955*(TL in cm)^2.97'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '57PKN'; % Cat of Life
metaData.links.id_ITIS = '168587'; % ITIS
metaData.links.id_EoL = '46578056'; % Ency of Life
metaData.links.id_Wiki = 'Trachurus_lathami'; % Wikipedia
metaData.links.id_ADW = 'Trachurus_lathami'; % ADW
metaData.links.id_Taxo = '154134'; % Taxonomicon
metaData.links.id_WoRMS = '159655'; % WoRMS
metaData.links.id_fishbase = 'Trachurus-lathami'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachurus_lathami}}';
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
bibkey = 'RuasSant2017'; type = 'article'; bib = [ ...
'doi = {10.3897/zoologia.34.e20475}, ' ...
'author = {Lygia C. Ruas and Andr\''{e} M. Vaz-dos-Santos}, ' ... 
'year = {2017}, ' ...
'title = { Age structure and growth of the rough scad, \emph{Trachurus lathami} ({T}eleostei: {C}arangidae), in the Southeastern {B}razilian {B}ight}, ' ...
'journal = {Zoologia}, ' ...
'volume = {34}, ' ...
'pages = {e20475}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Trachurus-lathami}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

