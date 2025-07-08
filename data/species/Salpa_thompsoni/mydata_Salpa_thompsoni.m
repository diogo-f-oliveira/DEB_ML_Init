function [data, auxData, metaData, txtData, weights] = mydata_Salpa_thompsoni
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Thaliacea'; 
metaData.order      = 'Salpida'; 
metaData.family     = 'Salpidae';
metaData.species    = 'Salpa_thompsoni'; 
metaData.species_en = 'Salp';

metaData.ecoCode.climate = {'MB','MC'};
metaData.ecoCode.ecozone = {'MS'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biP'};
metaData.ecoCode.gender  = {'Hsf'};
metaData.ecoCode.reprod  = {'Aa'};

metaData.T_typical  = C2K(5); % K
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'L-r'}; 

metaData.COMPLETE = 2.8; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2022 06 01];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};      

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2022 06 01]; 

%% set data
% zero-variate data;
data.ab = 4;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 40; units.am = 'd';    label.am = 'life span';               bibkey.am = 'guess';   
  temp.am = C2K(5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.3;  units.Lb  = 'cm';  label.Lb  = 'blastozooid length at birth';   bibkey.Lb  = 'LuskPakh2020';
  comment.Lb = 'from tL data';
data.Lp  = 2;  units.Lp  = 'cm';  label.Lp  = 'blastozooid length at puberty';   bibkey.Lp  = 'guess';
  comment.Lp = 'based on Lp/Li ratio of Cyclosalpa bakeri';
data.Li  = 4;  units.Li  = 'cm';  label.Li  = 'ultimate blastozooid length';   bibkey.Li  = 'LuskPakh2020';
  comment.Li = 'corrected for growth at 3.4 cm';

data.Wwi  = 2.8;   units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight of blastozooid'; bibkey.Wwi  = 'guess';
  comment.Wwi = 'based on weight-length relationship of Cyclosalpa bakeri: 44*(4/10)^3';

data.Ri  = 5; units.Ri  = '#/d';label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
temp.Ri = C2K(5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap=0.05';

% uni-variate data

% length - growth rate
data.Lr = [ ... % blastozoid length (mm), growth rate 100*g (%/d) in d/dt L = L*g*100
4.0657	13.1201
5.0190	6.8530
5.3182	9.1144
5.3843	5.7029
5.5844	7.0518
6.0535	5.6637
6.7219	5.8427
7.3873	6.7159
7.8066	4.9509
8.1004	8.4618
8.3689	5.8637
8.9860	5.9831
9.9024	8.3243
10.2709	6.4204
10.9407	6.2622
12.3334	5.5690
12.3404	3.9227
12.7435	5.9461
13.3225	2.9515
13.5143	6.2442
14.0902	3.9636
14.3956	4.7770
15.9908	4.8575
16.2512	4.1635
16.4092	3.3107
17.3823	4.4420
17.8481	3.8473
18.5694	3.6891
19.0871	2.9754
22.5253	5.3977
23.9829	1.5508
24.1340	2.3244
27.3785	1.9102
29.0255	1.9114
33.9656	2.1727];
data.Lr(:,1) = data.Lr(:,1)/10; % convert mm to cm
data.Lr(:,2) = data.Lr(:,2)*3/100; % 1/d, convert %/d to specific growth rate r in d/dt L = L*r/3
units.Lr = {'cm', '1/d'}; label.Lr = {'blastozoid length', 'specific growth rate'};  
temp.Lr = C2K(5); units.temp.Lr = 'K'; label.temp.Lr = 'temperature';
bibkey.Lr = 'LuskPakh2020'; 


%% set weights for all real data
weights = setweights(data, []);
weights.Lr = 3 * weights.Lr;
weights.Ri = 0 * weights.Ri;
weights.ab = 0 * weights.ab;
weights.Lb = 10 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.v = 3 * weights.psd.v;

%% pack data and txt_data for output
auxData.temp   = temp;
txtData.units  = units;
txtData.label  = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = '';     
metaData.discussion = struct('D1',D1); 

%% Links
metaData.links.id_CoL = '79F9S'; % Cat of Life
metaData.links.id_ITIS = '655946'; % ITIS
metaData.links.id_EoL = '46585568'; % Ency of Life
metaData.links.id_Wiki = 'Salpa_(genus)'; % Wikipedia
metaData.links.id_ADW = 'Salpa_thompsoni'; % ADW
metaData.links.id_Taxo = '41552'; % Taxonomicon, genus only
metaData.links.id_WoRMS = '266545'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Salpa_(genus)}}'; 
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
bibkey = 'LuskPakh2020'; type = 'article'; bib = [ ...
'doi = {10.1007/s00227-020-03775-x}, ' ...
'author = {Florian L\"{u}skow and Evgeny A. Pakhomov and Michael R. Stukel4,5 · and Moira D\''{e}cima}, ' ...
'year = {2020}, ' ...
'title  = {Biology of \emph{Salpa thompsoni} at the {C}hatham {R}ise, {N}ew {Z}ealand: demography, growth, and diel vertical migration}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {167}, '...
'pages = {175}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
