  function [data, auxData, metaData, txtData, weights] = mydata_Percina_tanasi
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Perciformes'; 
metaData.family     = 'Percidae';
metaData.species    = 'Percina_tanasi'; 
metaData.species_en = 'Snail darter'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(12.5); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'L-Ww'; 't-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Starrlight Augustine'};                             
metaData.date_subm = [2020 06 25];                          
metaData.email     = {'sta@akvaplan.niva.no'};                 
metaData.address   = {'Akvaplan-niva, FRAM, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2020 06 25]; 

%% set data
% zero-variate data
data.ab = 596/ 24;   units.ab = 'd';  label.ab = 'life span';                    bibkey.ab = 'Star1977';   
  temp.ab = C2K(12.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 0.7 * 365;   units.tp = 'd';  label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(12.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on short life span and seasonal cycles';
data.am = 4 * 365;   units.am = 'd';  label.am = 'life span';                    bibkey.am = 'fishbase';   
  temp.am = C2K(12.5); units.temp.am = 'K'; label.temp.am = 'temperature';
 
data.Lb = 0.75;  units.Lb = 'cm'; label.Lb = 'total length at birth';            bibkey.Lb = 'Star1977'; 
data.Lp = 4.8;  units.Lp = 'cm'; label.Lp = 'total length at puberty';           bibkey.Lp = 'Star1977'; 
data.Li = 9;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';
 
data.Wwb = 0.0141;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'Star1977';
  comment.Wwb = 'based on egg diameter of 1.5 mm: 4/3*pi*0.15^3';
 
data.Ri = 600/365;   units.Ri = '#/d';  label.Ri = 'ultimate reproduction rate';  bibkey.Ri = 'Star1977';
  temp.Ri = C2K(12.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% length-weight
data.LWw = [ ... % total length (mm), weight (cg)
38.62	9.42
42.07	12.04
42.90	12.71
43.52	11.84
43.66	13.52
45.17	14.46
46.83	16.28
47.93	17.22
49.24	19.10
47.86	19.10
49.93	21.73
51.03	22.87
54.97	26.70
55.86	28.79
57.17	29.33
52.34	28.79
53.86	29.60
54.76	30.47
55.10	33.83
57.10	32.69
58.90	40.70
61.66	44.33
63.10	46.68
64.00	44.87
66.28	45.47
66.28	44.46
64.00	41.70
62.90	40.90
65.93	40.09];
data.LWw = data.LWw/ 10;  % convert mm and cg to cm and g
units.LWw = {'cm', 'g'}; label.LWw = {'standard length', 'wet weight'};  
bibkey.LWw = 'Star1977';
comment.LWw = 'fig. 16, Data for males and females together';

% time-length
data.tL = [ ... % time since birth (d)(yr), total length (cm)
1.890	0.75
86.466	4.173
175.716	4.484
243.584	5.689
356.382	5.131
408.377	5.655
530.527	5.742
586.828	6.347
610.956	6.178
707.827	6.514
775.557	6.408];
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(12.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Star1977';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 10 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = weights.psd.v * 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
% D1 = '';
% metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'length-weight Ww in g = 0.00513 * (TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '76RT2'; % Cat of Life
metaData.links.id_ITIS = '168499'; % ITIS
metaData.links.id_EoL = '208233'; % Ency of Life
metaData.links.id_Wiki = 'Percina_tanasi'; % Wikipedia
metaData.links.id_ADW = 'Percina_tanasi'; % ADW
metaData.links.id_Taxo = '183497'; % Taxonomicon
metaData.links.id_WoRMS = '1012787'; % WoRMS
metaData.links.id_fishbase = 'Percina-tanasi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Etheostoma_cragini}}';  
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
bibkey = 'Star1977'; type = 'Phdthesis'; bib = [ ...  
'author = {Starnes, Wayne C.}, ' ...
'year = {1977}, ' ...
'title = {The Ecology and Life History of the Endangered Snail Darter, \emph{Percina (Imostoma) tanasi} {E}tnier}, ' ... 
'school = {University of Tennessee}, ' ...
'address = {Knoxville}, '...
'month = {March}, '...
'url = {https://trace.tennessee.edu/utk_graddiss/2545}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Percina-tanasi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
