  function [data, auxData, metaData, txtData, weights] = mydata_Vermicella_annulata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Elapidae';
metaData.species    = 'Vermicella_annulata'; 
metaData.species_en = 'Bandy-bandy'; 

metaData.ecoCode.climate = {'BWh', 'BWk', 'BSh', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'biTf', 'biTh', 'biTg', 'biTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'};  
metaData.data_1     = {'t-L'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 03];

%% set data
% zero-variate data
data.ab = 14*7;    units.ab = 'd';  label.ab = 'age at birth';        bibkey.ab = 'Wiki';
  temp.ab = C2K(28.5); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365;    units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'guess';
  temp.am = C2K(28.5); units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb = 17;     units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'Shin1980';
data.Lp = 35.5;     units.Lp = 'cm';     label.Lp = 'SVL at puberty for females'; bibkey.Lp = 'Shin1980'; 
data.Lpm = 29;    units.Lpm = 'cm';     label.Lpm = 'SVL at puberty for males'; bibkey.Lpm = 'Shin1980'; 
data.Li = 54.4;    units.Li = 'cm';     label.Li = 'ultimate SVL for females';  bibkey.Li = 'Shin1980';
data.Lim = 39.2;   units.Lim = 'cm';     label.Lim = 'ultimate SVL for males';  bibkey.Lim = 'Shin1980';

data.Wwb = 1.29;     units.Wwb = 'g';     label.Wwb = 'weight at birth';  bibkey.Wwb = 'guess';
  comment.Wwb = 'based on photo with diameter/length ratio of 0.0183 and Lb: 17*pi*(17*0.0183/2)^2';
data.Wwi = 42;     units.Wwi = 'g';     label.Wwi = 'weight at birth';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based on photo with diameter/length ratio of 0.0183 and Li: 54.4*pi*(54.4*0.0183/2)^2';
  
% univariate data
% time - length
data.tL = [ ... % time since birth (d), snout-vent length (cm)
90.931	16.357
148.199	16.995
287.152	19.484
306.428	19.643
307.066	21.512
322.797	17.850
323.979	19.151
330.707	17.198
365-3.096	17.842
365+33.309	21.330
365+42.876	19.539
365+42.941	21.246
365+65.617	21.404
365+66.659	18.964
365+77.559	22.458
365+84.480	25.627
365+140.529	23.989
365+158.521	20.163
365+192.607	22.270
365+210.743	22.266
365+244.678	20.388
365+249.443	26.485
365+302.149	26.392
365+323.787	29.070
365+329.344	26.142
365+344.678	26.951
365+355.998	26.542
365+369.055	27.108
365+384.961	28.080
730-13.404	30.039
730+32.997	28.078
730+42.096	28.889
730+78.883	27.498
730+90.314	30.016
730+134.629	32.852
730+139.582	28.948
730+143.636	31.224
730+148.084	28.946
730+148.152	30.735
730+156.739	33.009
730+157.257	31.708
730+163.546	33.170
730+170.311	32.193
730+197.969	29.179];
data.tL(:,1) =  data.tL(:,1) - 90; % set origin to birth
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'snout-vent length'};  
temp.tL   = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Shin1980'; 

% length-fecundity
data.LN = [ ... % SVL (cm), cluth size (#)
35.508	1.929
40.585	4.057
44.508	3.998
50.738	4.966
51.477	6.933
52.308	7.990
53.046	11.011
54.108	7.924
54.108	7.924
56.415	8.987
57.523	10.846
58.123	12.884
58.538	8.886
59.600	8.999
65.000	5.964];
units.LN = {'cm', '#'};  label.LN = {'snout-vent length', 'yearly fecundity'};  
temp.LN   = C2K(28.5);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Shin1980'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;
weights.Lb = 3 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Ovoviviparous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7FQ4R'; % Cat of Life
metaData.links.id_ITIS = '700708'; % ITIS
metaData.links.id_EoL = '462103'; % Ency of Life
metaData.links.id_Wiki = 'Vermicella_annulata'; % Wikipedia
metaData.links.id_ADW = 'Vermicella_annulata'; % ADW
metaData.links.id_Taxo = '50260'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Vermicella&species=annulata'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Vermicella_annulata}}';
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
bibkey = 'Shin1980'; type = 'Article'; bib = [ ...  
'author = {Richard Shine}, ' ...
'year = {1980}, ' ...
'title = {Reproduction, Feeding and Growth in the {A}ustralian Burrowing Snake \emph{Vermicella annulata}}, ' ... 
'journal = {Journal of Herpetology}, ' ...
'volume = {14(1)}, '...
'pages = {71-77}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 

