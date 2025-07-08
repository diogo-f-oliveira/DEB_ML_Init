function [data, auxData, metaData, txtData, weights] = mydata_Merluccius_capensis
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Gadiformes'; 
metaData.family     = 'Merlucciidae';
metaData.species    = 'Merluccius_capensis'; 
metaData.species_en = 'Shallow-water Cape hake'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jpCi', 'piCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10); % in K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'}; 
metaData.date_subm = [2019 01 20]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 01 20]; 

%% set data
% zero-variate data
data.am = 20*365;     units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';  
  temp.am = C2K(10); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 47.4;     units.Lp = 'cm';   label.Lp = 'total length at puberty for females';  bibkey.Lp = 'fishbase';
data.Li = 140;    units.Li = 'cm';   label.Li = 'ultimate total length';       bibkey.Li = 'fishbase';

data.Wwb = 3.8e-4;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 900 mum: pi/6*0.09^3';
data.Wwp = 809;  units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';        bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on Wwp = 0.00537*Lp^3.09, see F1';
data.Wwi = 23e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on Wwi = 0.00537*Li^3.09, see F1';
  
data.GSI = 20; units.GSI = '-';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(10); units.temp.GSI = 'K'; label.temp.GSI = 'temperature'; 

% uni-variate data
% time-length data     
data.tL = [ ... % time since birth (yr), total length (cm) 
0.117	6.248
0.135	6.630
0.193	5.228
0.274	7.268
0.315	6.120
0.315	7.395
0.350	8.415
0.368	5.738
0.374	9.435
0.403	6.248
0.403	7.395
0.420	11.093
0.426	8.288
0.450	10.328
0.560	8.288
0.560	9.435
0.572	8.798
0.572	10.073
0.578	7.523
0.578	11.220
0.613	10.583
0.660	14.281
0.683	12.623
0.706	14.153
0.753	15.301
0.794	14.025
0.875	14.153
0.887	17.086
0.904	14.536
0.934	18.616
0.957	16.321
0.957	17.086
0.998	20.018
1.016	18.616
1.027	16.958
1.039	17.723
1.115	19.508
1.150	19.508
1.470	23.206
1.471	25.756
2.118	31.366
2.136	33.024
2.469	42.077
3.425	55.337
3.478	53.807
3.776	62.350
3.933	62.605
3.933	66.047
3.933	66.430];
data.tL(:,1) = data.tL(:,1)*365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(10);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'WilhMolo2017';
comment.tL = 'data from 1994';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'length-weight: Ww in g = 0.00537*(TL in cm)^3.09';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '73B5L'; % Cat of Life
metaData.links.id_ITIS = '164798'; % ITIS
metaData.links.id_EoL = '46564944'; % Ency of Life
metaData.links.id_Wiki = 'Merluccius_capensis'; % Wikipedia
metaData.links.id_ADW = 'Merluccius_capensis'; % ADW
metaData.links.id_Taxo = '44368'; % Taxonomicon
metaData.links.id_WoRMS = '217746'; % WoRMS
metaData.links.id_fishbase = 'Merluccius-capensis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Merluccius_capensis}}';
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
bibkey = 'WilhMolo2017'; type = 'article'; bib = [ ...
'author = {M.R. Wilhelm and C.L. Moloney and S. Paulus and J-P. Roux}, ' ... 
'year   = {2017}, ' ...
'title  = {Fast growth inferred for northern {B}enguela shallow-water hake \emph{Merluccius capensis} using annual survey- and monthly commercial length-frequency distributions}, ' ...
'journal = {Fisheries Research}, ' ...
'page = {7-14}, ' ...
'volume = {193}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Merluccius-capensis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

