function [data, auxData, metaData, txtData, weights] = mydata_Epinephelus_rivulatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Serranidae';
metaData.species    = 'Epinephelus_rivulatus'; 
metaData.species_en = 'Halfmoon grouper'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.2); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 09 04];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 04];

%% set data
% zero-variate data

data.am = 7 * 365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'ThilMcIl2016';   
  temp.am = C2K(27.2); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on tL data';

data.Lp  = 19.4;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 45;      units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';

data.Wwb = 1.13e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.6 mm: pi/6*0.06^3';
data.Wwp = 100.5;    units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01259*Lp^3.03, see F1';
data.Wwi = 1.3e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01259*Li^3.03, see F1';

data.GSI  = 0.045;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'Mack2000';   
  temp.GSI = C2K(16);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.968	16.208
0.969	15.229
0.970	14.034
0.971	12.186
0.995	12.730
1.020	11.208
1.897	17.088
1.921	17.958
1.922	16.219
1.941	25.350
1.942	22.850
1.943	21.872
1.944	19.915
1.945	19.480
1.946	18.502
1.947	15.241
1.965	26.220
1.972	14.481
2.017	20.786
2.922	20.362
2.941	30.253
2.942	29.492
2.944	24.492
2.945	23.949
2.968	25.362
2.971	21.341
2.972	21.014
2.991	28.080
2.992	27.428
2.993	26.341
2.994	23.080
2.995	22.319
2.996	21.884
2.997	19.602
2.998	18.841
3.017	25.037
3.945	27.222
3.948	23.744
3.971	26.244
3.972	24.722
3.993	28.635
4.969	32.886
4.970	31.582
4.973	27.234
4.974	26.039
4.995	30.604
4.996	30.061
5.021	28.648
5.946	34.529
5.996	32.899
5.997	31.703
6.998	34.867];
data.tL(:,1) = (0.25 + data.tL(:,1)) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(27.2);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ThilMcIl2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
% data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = ''; label.psd.k = 'maintenance ratio';
% weights.psd.p_M = 3 * weights.psd.p_M;
% weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Hermaphroditic, so kap_R is reduced ba a factor 2';
D2 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'length-weight: W in g = 0.01259*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Females become male at TL 75.6 cm';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6TR6R'; % Cat of Life
metaData.links.id_ITIS = '551092'; % ITIS
metaData.links.id_EoL = '46579633'; % Ency of Life
metaData.links.id_Wiki = 'Epinephelus_rivulatus'; % Wikipedia
metaData.links.id_ADW = 'Epinephelus_rivulatus'; % ADW
metaData.links.id_Taxo = '105883'; % Taxonomicon
metaData.links.id_WoRMS = '218216'; % WoRMS
metaData.links.id_fishbase = 'Epinephelus_rivulatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Epinephelus_rivulatus}}';
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
bibkey = 'ThilMcIl2016'; type = 'Article'; bib = [ ... 
'doi = {10.1007/s00338-015-1367-y}, ' ...
'author = {Thillainath, E.C. and J.L. McIlwain and S.K. Wilson and M. Depczynski}, ' ... 
'year = {2016}, ' ...
'title = {Estimating the role of three mesopredatory fishes in coral reef food webs at {N}ingaloo {R}eef, {W}estern {A}ustralia}, ' ...
'journal = {Coral Reefs}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mack2000'; type = 'Article'; bib = [ ... 
'author = {Michael Mackie}, ' ... 
'year = {2000}, ' ...
'title = {Reproductive biology of the halfmoon grouper, \emph{Epinephelus rivulatus}, at {N}ingaloo {R}eef, {W}estern {A}ustralia}, ' ...
'journal = {Environmental Biology of Fishes}, ' ...
'volume = {57}, ' ...
'pages = {363–376}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Epinephelus-rivulatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

