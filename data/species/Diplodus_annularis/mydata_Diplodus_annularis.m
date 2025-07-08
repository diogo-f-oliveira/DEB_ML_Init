function [data, auxData, metaData, txtData, weights] = mydata_Diplodus_annularis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Spariformes'; 
metaData.family     = 'Sparidae';
metaData.species    = 'Diplodus_annularis'; 
metaData.species_en = 'Annular seabream'; 
metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE', 'MAm'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biCi', 'jiHa'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(19); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lh'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 19];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 19]; 



%% set data
% zero-variate data

data.ab = 4;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'guess';   
  temp.ab = C2K(20); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Diplodus puntazzo';
data.am = 7*365; units.am = 'd';    label.am = 'life span';               bibkey.am = 'fishbase';   
  temp.am = C2K(19); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11.2;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'fishbase';  
data.Li  = 27.5;    units.Li  = 'cm';  label.Li  = 'ultimate total length';  bibkey.Li  = 'fishbase';

data.Wwb = 3.2e-4;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.85 mm of Diplodes sargus: pi/6*0.085^3';
data.Wwi = 330;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';

data.Ri  = 212e3/365; units.Ri  = '#/d'; label.Ri  = 'max reproduction rate'; bibkey.Ri = 'fishbase';   
temp.Ri = C2K(19); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% t-L data
data.tL = [ ... % time since birth (yr), total length (cm)
0.138	1.787
0.218	2.758
0.308	3.404
0.388	3.969
1.307	9.699
1.307	9.294
1.657	12.608
1.997	13.896
2.317	15.428
2.317	13.484
2.317	13.241
2.318	12.836
2.318	12.512
2.327	14.942
2.327	13.889
2.337	14.131
2.387	14.697
2.396	16.965
2.397	16.155
2.397	15.669
2.397	15.183
2.638	14.043
2.647	15.906
2.647	15.501
2.657	15.015
2.667	14.529
2.817	16.146
2.817	15.578
2.818	15.092
2.818	14.444
2.818	13.958
2.818	13.391
2.847	17.036
2.977	17.033
2.987	18.572
2.998	15.979
3.067	17.436
3.067	16.950
3.067	16.383
3.068	16.059
3.338	17.025
3.407	18.400
3.407	17.914
3.658	16.531
3.978	19.035
4.058	18.952
4.069	16.603
4.078	18.304
4.079	17.656
4.079	17.170
4.098	19.923
5.019	20.955
5.080	17.875
5.089	20.387
5.089	19.982
5.089	19.252
5.090	18.766
6.101	19.877];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(19);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GordMoli1997';
  
%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Normally sexes are separate but some individuals are protandrous';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6CXQT'; % Cat of Life
metaData.links.id_ITIS = '182915'; % ITIS
metaData.links.id_EoL = '46579944'; % Ency of Life
metaData.links.id_Wiki = 'Diplodus_annularis'; % Wikipedia
metaData.links.id_ADW = 'Diplodus_annularis'; % ADW
metaData.links.id_Taxo = '173221'; % Taxonomicon
metaData.links.id_WoRMS = '127049'; % WoRMS
metaData.links.id_fishbase = 'Diplodus-annularis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Diplodus}}';
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
bibkey = 'GordMoli1997'; type = 'Article'; bib = [ ... 
'author = {Ana Gordoa and Balbina Mol\''{i}}, ' ... 
'year = {1997}, ' ...
'title = {Age and growth of the sparids \emph{Diplodus vulgaris}, \emph{D. sargus} and \emph{D. annularis} in adult populations and the differences in their juvenile growth patterns in the north-western {M}editerranean {S}ea}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {33}, ' ...
'pages = {123-129}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
