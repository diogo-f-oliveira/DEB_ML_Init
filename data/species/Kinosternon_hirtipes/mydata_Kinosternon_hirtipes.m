function [data, auxData, metaData, txtData, weights] = mydata_Kinosternon_hirtipes
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Kinosternidae';
metaData.species    = 'Kinosternon_hirtipes'; 
metaData.species_en = 'Rough-footed mud turtle'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 03];

%% set data
% zero-variate data

data.tp = 7*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'IverBart1991';   
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = '6-8 yrs';
data.am = 40*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on other species of Kinosternidae ';

data.Lb  = 1.95;   units.Lb   = 'cm';  label.Lb  = 'plastron length at birth';         bibkey.Lb  = 'IverBart1991'; 
data.Lp  = 9.75; units.Lp  = 'cm';  label.Lp  = 'carapace length fat puberty'; bibkey.Lp  = 'IverBart1991';
  comment.Lp = '9.5-10 cm';
data.Li  = 11.3;   units.Li  = 'cm';  label.Li  = 'ultimate carapace length for females'; bibkey.Li  = 'IverBart1991';

data.Wwi = 212.7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';   bibkey.Wwi = 'IverBart1991';

data.Ri  = 3*2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'IverBart1991';   
  temp.Ri = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-6 eggs per clutch, 2 clutch per yr assumed';
 
% uni-variate data
data.tL = [ ... % time since birth (yr), carapace length (cm)
0.058	1.949
0.127	2.697
0.362	3.881
0.876	4.417
0.895	5.228
0.910	4.729
1.322	4.787
1.571	5.097
1.573	5.575
1.574	5.908
1.859	6.925
1.860	7.175
1.874	6.634
1.888	5.905
1.905	6.217
2.023	6.820
2.055	6.507
2.104	6.278
2.285	6.297
2.733	6.917
2.788	8.269
2.836	7.873
2.965	7.164
2.983	7.601
2.987	8.558
2.989	9.037
3.013	6.852
3.017	7.934
3.085	8.287
3.311	7.099
3.593	7.595
3.648	8.947
3.734	9.716
3.797	8.988
3.818	10.049
3.866	9.715
3.943	8.549
4.011	9.006
4.046	9.401
4.064	9.692
4.287	7.984
4.840	10.060
4.870	9.310
4.879	11.495
4.926	10.787
4.947	7.957
4.950	8.644
5.022	10.100
5.853	11.839
5.877	9.613
5.910	9.654
5.932	10.798
5.974	9.050
6.041	9.382
6.081	10.922
6.291	9.983
7.316	10.556
7.842	10.073
8.006	10.030
8.325	11.275
8.921	11.790
9.351	12.098
10.327	12.941];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'carapace length'};  
temp.tL   = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'IverBart1991';
comment.tL = 'sexes combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;


%% Discussion points
D1 = 'Males are assumed to differ not from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'males tend to be larger than females';
metaData.bibkey.F1 = 'IverBart1991'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3R86C'; % Cat of Life
metaData.links.id_ITIS = '173767'; % ITIS
metaData.links.id_EoL = '792971'; % Ency of Life
metaData.links.id_Wiki = 'Kinosternon_hirtipes'; % Wikipedia
metaData.links.id_ADW = 'Kinosternon_hirtipes'; % ADW
metaData.links.id_Taxo = '48344'; % Taxonomicon
metaData.links.id_WoRMS = '1287525'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Kinosternon&species=hirtipes'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kinosternon_hirtipes}}';
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
bibkey = 'IverBart1991'; type = 'Article'; bib = [ ... 
'author = {John B. Iverson and Erika L. Barthelmess and Geoffrey R. Smith and Catherine E. Derivera}, ' ... 
'year = {1991}, ' ...
'title = {Growth and Reproduction in the Mud Turtle \emph{Kinosternon hirtipes} in Chihuahua, Mexico}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {25(1)}, ' ...
'pages = {64-72}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/792971}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

