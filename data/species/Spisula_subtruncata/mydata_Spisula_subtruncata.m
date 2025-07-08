 function [data, auxData, metaData, txtData, weights] = mydata_Spisula_subtruncata

%% set metadata
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Venerida'; 
metaData.family     = 'Mactridae';
metaData.species    = 'Spisula_subtruncata'; 
metaData.species_en = 'Subtruncate surf clam'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MAE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K. body temperature   
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wdp'; 'WdR_Wd'}; 
metaData.data_1     = {'t-L', 't-Wd'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 08 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2017 08 06]; 

%% set data
% zero-variate data;

data.ab = 3;       units.ab = 'd';     label.ab = 'age at birth';                      bibkey.ab = 'CardWitt2007';  
  temp.ab = C2K(15);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 24;       units.tj = 'd';    label.tj = 'time since birth at metamorphosis'; bibkey.tj = 'CardWitt2007';
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 180;   units.tp = 'd';    label.tp = 'time since birth at puberty';          bibkey.tp = 'CardWitt2007';
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365;   units.am = 'd';    label.am = 'life span';                         bibkey.am = 'CardWitt2007';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 1;     units.Lp  = 'cm';  label.Lp  = 'shell lenght at puberty';           bibkey.Lp  = 'CardWitt2007';
data.Li  = 3.5;      units.Li  = 'cm';  label.Li  = 'ultimate shell height';          bibkey.Li  = 'Wiki';

data.Wwb = 9.7e-8;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';         bibkey.Wwb = 'CardWitt2007';
  comment.Wwb = 'based on egg diameter of 57 mum: pi/6*0.0057^3';
data.Wdp = 0.02;     units.Wdp = 'g';   label.Wdp = 'ashfree dry weight at puberty';  bibkey.Wdp = 'CardWitt2007';

data.WdR1  = 0.014;    units.WdR1  = 'g'; label.WdR1  = 'ashfree dry gonadal mass at 0.05 g AFDW';  bibkey.WdR1  = 'CardWitt2007';   
  temp.WdR1 = C2K(15); units.temp.WdR1 = 'K'; label.temp.WdR1 = 'temperature';
data.WdR2  = 0.030;    units.WdR2  = 'g'; label.WdR2  = 'ashfree dry gonadal mass at 0.13 g AFDW';  bibkey.WdR2  = 'CardWitt2007';   
  temp.WdR2 = C2K(15); units.temp.WdR2 = 'K'; label.temp.WdR2 = 'temperature';
data.WdR3  = 0.038;    units.WdR3  = 'g'; label.WdR3  = 'ashfree dry gonadal mass at 0.17 g AFDW';  bibkey.WdR3  = 'CardWitt2007';   
  temp.WdR3 = C2K(15); units.temp.WdR3 = 'K'; label.temp.WdR3 = 'temperature';

   
% uni-variate data 

% t-L data 
data.tL = [  ... % time since birth (yr), shell length (cm)
0.700	1.189
0.782	1.067
0.905	1.525
1.101	1.310
1.111	0.936
1.337	1.694
1.368	1.881
1.399	2.124
1.440	1.666
1.708	1.525
1.790	1.460
1.934	2.190
2.027	1.975
2.078	1.610
2.233	2.274
2.335	2.180
2.366	2.620
2.397	2.424
2.469	2.274
2.716	2.115
2.767	2.227
2.891	2.405
2.963	2.536
3.056	2.574
3.076	2.433
3.076	2.302
3.210	2.564
3.323	2.611
3.354	2.265
3.385	2.733
3.488	2.611
3.765	2.283
3.920	2.686
4.012	2.714
4.074	2.761
4.105	2.630
4.208	2.695
4.331	2.602
4.403	2.985
4.455	2.817
4.794	2.714];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CardWitt2007';

% t-W data
data.tW = [ ... % time since birth (yr), ashfree somatic dry mass (g)
0.710	0.015
0.792	0.020
0.916	0.025
1.101	0.016
1.101	0.006
1.337	0.035
1.399	0.058
1.481	0.044
1.728	0.046
1.811	0.054
1.965	0.076
2.068	0.055
2.140	0.027
2.243	0.121
2.335	0.105
2.377	0.123
2.428	0.133
2.510	0.104
2.726	0.137
2.798	0.134
3.035	0.101
3.107	0.093
3.251	0.156
3.344	0.162
3.416	0.119
3.416	0.185
3.477	0.151
3.796	0.176
4.064	0.108
4.115	0.124];
data.tW(:,1) = data.tW(:,1) * 365; % convert yr to d
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'ashfree somatic dry mass'};  
temp.tW    = C2K(15);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'CardWitt2007';

%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab ;
%weights.Wwb = 10 * weights.Wwb ;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Links
metaData.links.id_CoL = '4Z979'; % Cat of Life
metaData.links.id_ITIS = '80950'; % ITIS
metaData.links.id_EoL = '46471944'; % Ency of Life
metaData.links.id_Wiki = 'Spisula_subtruncata'; % Wikipedia
metaData.links.id_ADW = 'Spisula_subtruncata'; % ADW
metaData.links.id_Taxo = '39755'; % Taxonomicon
metaData.links.id_WoRMS = '140302'; % WoRMS
metaData.links.id_molluscabase = '140302'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Spisula}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S. A. L. M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CardWitt2007'; type = 'Article'; bib = [ ... 
'author = {J. F. M. F. Cardoso and J. IJ. Witte and H. W. van der Veer}, ' ... 
'year = {2007}, ' ...
'title = {Growth and reproduction of the bivalve \emph{Spisula subtruncata} (da {C}osta) in {D}utch coastal waters}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {57}, ' ...
'pages = {316-324}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

