function [data, auxData, metaData, txtData, weights] = mydata_Noturus_lachneri

%% set metaData

metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Siluriformes'; 
metaData.family     = 'Ictaluridae';
metaData.species    = 'Noturus_lachneri'; 
metaData.species_en = 'Ouachita madtom'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fnm'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

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

data.am = 3*365;     units.am = 'd';    label.am = 'life span';     bibkey.am = 'TumiHard2014';
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 6.1;  units.Lp  = 'cm';	label.Lp  = 'total length at puberty';  bibkey.Lp  = 'TumiHard2014';
data.Li  = 10;   units.Li  = 'cm';	label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
  
data.Wwb = 8.2e-3; units.Wwb = 'g';	label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'TumiHard2014'; 
  comment.Wwb = 'based on egg diameter of 2.5 mm: pi/6*0.25^3';
data.Wwp = 1.56; units.Wwp = 'g';	label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'TumiHard2014','fishbase'}; 
  comment.Wwp = 'based on 0.00575*Lp^3.10, see F1';
data.Wwi = 7.2; units.Wwi = 'g';	label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'fishbase'; 
  comment.Wwi = 'based on 0.00575*Li^3.10, see F1';
   
data.Ri = 69/365; units.Ri = '#/d'; label.Ri = 'reprod rate at TL 6.9 cm'; bibkey.Ri = 'TumiHard2014';   
  temp.Ri = C2K(12);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% uni-variate data
% time-length
data.tL = [ ... % time since 20 Oct (d), total length (cm)
 0.000	2.562
 8.277	2.519
14.870	2.519
28.400	2.779
37.193	2.765
45.936	3.286
55.096	3.271
69.725	3.517
76.672	3.662
84.728	3.691
96.049	4.067
102.299	3.821
110.727	3.792
123.166	3.966
132.304	4.183
139.979	4.371
148.043	4.313
157.927	4.385
168.882	4.761
176.587	4.617
182.069	4.761
191.964	4.703
211.682	5.398
220.423	5.948
231.056	5.832
238.010	5.904
251.923	5.976
265.444	6.324
279.002	6.280];
data.tL(:,1) = (70 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'TumiHard2014';
comment.tL = 'first hatchling at 25 July with TL 1.5 cm';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

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
metaData.facts = struct('F1',F1); 

%% Links
metaData.links.id_CoL = '47ZMX'; % Cat of Life
metaData.links.id_ITIS = '164018'; % ITIS
metaData.links.id_EoL = '208033'; % Ency of Life
metaData.links.id_Wiki = 'Noturus_lachneri'; % Wikipedia
metaData.links.id_ADW = 'Noturus_lachneri'; % ADW
metaData.links.id_Taxo = '181576'; % Taxonomicon
metaData.links.id_WoRMS = '1013247'; % WoRMS
metaData.links.id_fishbase = 'Noturus-lachneri'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Noturus_lachneri}}';
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
bibkey = 'TumiHard2014'; type = 'article'; bib = [ ...  
'author = {R. Tumilson and J. O. Hardage}, ' ...
'year = {2014}, ' ...
'title = {Growth and Reproduction in the Ouachita Madtom (\emph{Noturus lachneri}) at the Periphery of its Distribution}, ' ... 
'journal = {Journal of the Arkansas Academy of Science}, '...
'volume = {68}, ' ...
'pages = {Article 19}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Noturus-lachneri.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

