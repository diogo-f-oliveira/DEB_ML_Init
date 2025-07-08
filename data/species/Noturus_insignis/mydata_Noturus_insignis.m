function [data, auxData, metaData, txtData, weights] = mydata_Noturus_insignis

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_insignis'; 
metaData.species_en = 'Margined madtom'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2020 10 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 10 12]; 

%% set data
% zero-variate data;

data.ab = 7;     units.ab = 'd';    label.ab = 'age at birth';     bibkey.ab = 'fishbase';
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 4.5*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'ClugCoop1960';
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 7.1;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'ClugCoop1960';
  comment.Lp = 'Based on spwning at 2 yr and tL data';
data.Li  = 15;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  
data.Wwb = 3.35e-2; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'ClugCoop1960'; 
  comment.Wwb = 'based on egg diameter of 4 mm: pi/6*0.4^3';
   
data.Ri = 300/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate'; bibkey.Ri = 'guess';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri= 'based on sized-corrected Noturus miurus: ';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.045	1.994
0.078	2.583
0.134	3.443
0.220	4.236
0.298	4.553
0.384	5.323
0.790	4.550
0.875	4.232
0.976	6.475
1.020	6.814
1.054	7.154
1.125	8.105
1.356	8.897
1.765	9.507
1.851	9.937
1.940	9.913
1.981	9.868
2.034	9.958
2.101	11.159
2.354	11.520
2.756	11.744
2.827	11.925
2.920	11.449
2.972	11.199
3.020	11.425
3.080	13.260
3.318	13.486
3.739	13.506
3.821	13.777
3.899	13.686
3.948	12.666
3.978	13.097
4.030	14.003];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'ClugCoop1960';


% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
    1.92  0.1
    2.20  0.2
    2.90  0.4
    3.33  0.5
    3.70  0.6
    4.33  0.9
    6.33  2.6
    6.87  3.3
    7.31  3.9
    7.75  4.6
    8.27  6.2
    8.74  7.2
    9.25  8.5
    9.81 10.0
   10.22 11.0
   10.84 13.2
   11.31 15.1
   11.77 17.7
   12.31 21.1
   12.74 22.5
   13.34 27.3
   14.34 33.8
   14.70 39.7];
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'ClugCoop1960';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.ab = 5 * weights.ab;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed not to differ from fenales';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00575*(TL in cm)^3.10';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'length-length: SL = 0.86*TL';
metaData.bibkey.F2 = 'ClugCoop1960'; 
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '47ZMW'; % Cat of Life
metaData.links.id_ITIS = '164004'; % ITIS
metaData.links.id_EoL = '47261935'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_insignis'; % Wikipedia
metaData.links.id_ADW = 'Noturus_insignis'; % ADW
metaData.links.id_Taxo = '181575'; % Taxonomicon
metaData.links.id_WoRMS = '1022572'; % WoRMS
metaData.links.id_fishbase = 'Noturus-insignis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_insignis}}';
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
bibkey = 'ClugCoop1960'; type = 'article'; bib = [ ...  
'author = {James P. Clugston and Edwin L. Cooper}, ' ...
'year = {1982}, ' ...
'title = {Growth of the Common Eastern Madtom, \emph{Noturus insignis} in {C}entral {P}ennsylvania}, ' ... 
'journal = {The American Midland Naturalist}, '...
'volume = {1960(1)}, ' ...
'pages = {9-16}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-insignis.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

