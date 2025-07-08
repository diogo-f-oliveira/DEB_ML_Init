function [data, auxData, metaData, txtData, weights] = mydata_Liolaemus_wiegmannii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lacertidae';
metaData.species    = 'Liolaemus_wiegmannii'; 
metaData.species_en = 'Lizard'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTg', '0iTh', '0iTa'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 04];

%% set data
% zero-variate data

data.ab = 56;  units.ab = 'd';    label.ab = 'age at birth';         bibkey.ab = 'guess';   
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365;  units.am = 'd';    label.am = 'life span';            bibkey.am = 'guess';   
  temp.am = C2K(20); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Liolaemus_pictus';

data.Lb  = 2.2;    units.Lb  = 'cm';  label.Lb  = 'SVL at hatching';      bibkey.Lb  = 'MartCard1998';
data.Lp  = 4.2;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';  bibkey.Lp  = 'MartCard1998'; 
data.Li  = 5.8;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';  bibkey.Li  = 'MartCard1998'; 

data.Wwi = 3.84;   units.Wwi = 'g';  label.Wwi = 'ultimate wet '; bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on Podarcis muralis: 5.41*(5.0/6.5)^3';

data.Ri  = 3.5*4/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MartCard1998';   
  temp.Ri = C2K(20);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3-8 eggs per clutch, assumed: 3-4 clutches per yr';

% univariate data
% time-length
data.tL = [ ... % time since birth (yr), SVL (cm): females, males
-0.530	2.203
-0.347	1.997
16.866	2.904
17.396	2.598
17.538	3.110
17.725	2.822
34.609	3.509
34.614	3.422
34.945	3.614
34.980	3.011
35.446	3.825
35.451	3.729
51.834	4.215
52.017	3.995
52.199	3.812
52.523	4.114
52.552	3.607
52.728	3.520
68.779	3.823
70.119	4.321
70.284	4.413
70.295	4.225
70.654	3.928
87.748	3.920
87.873	4.725
87.886	4.510
87.913	4.025
88.221	4.615
105.310	4.708
105.345	4.104
105.494	4.484
105.816	4.823
105.828	4.617
106.032	4.031
122.784	4.037
122.905	4.911
122.911	4.806
122.917	4.705
122.927	4.527
140.186	4.638
140.347	4.811
157.777	4.913
158.307	4.621
175.393	4.745
175.726	4.906
175.731	4.823];
data.tL(:,1) = data.tL(:,1)+7; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MartCard1998'; comment.tL = 'Selected point from seleted data';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Lb = 3 * weights.Lb;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '3V6NX'; % Cat of Life
metaData.links.id_ITIS = '1055961'; % ITIS
metaData.links.id_EoL = '791719'; % Ency of Life
metaData.links.id_Wiki = 'Liolaemus_wiegmannii'; % Wikipedia
metaData.links.id_ADW = 'Liolaemus_wiegmannii'; % ADW
metaData.links.id_Taxo = '643945'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Liolaemus&species=wiegmannii'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Liolaemus_wiegmannii}}';
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
bibkey = 'MartCard1998'; type = 'Article'; bib = [ ...
'doi = {10.1163/156853898x00197}, ' ...
'author = {Martori, R. and Cardinale, L. and Vignolo, P.}, ' ... 
'year = {1998}, ' ...
'title = {Growth in a population of Liolaemus wiegmannii (Squamata: Tropiduridae) in Central Argentina), }, ' ...
'jpurnal = {Amphibia-Reptilia}, ' ...
'volume = {19(3}, ' ...
'pages = {293–301}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

