function [data, auxData, metaData, txtData, weights] = mydata_Naso_lituratus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Acanthuriformes'; 
metaData.family     = 'Acanthuridae';
metaData.species    = 'Naso_lituratus'; 
metaData.species_en = 'Orangespine unicornfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIE','MP'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiHa', 'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 12 03];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 12 03];

%% set data
% zero-variate data

data.am = 13*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'TaylRhod2014';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 23; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess'; 
data.Li  = 46;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 1.8e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Tuck1998';
  comment.Wwb = 'based egg diameter of 0.7 mm of Acanthurus lineatus: pi/6*0.07^3'; 
data.Wwp = 278; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.02512*Lp^2.97, see F1';
data.Wwi = 2.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02512*Li^2.97, see F1';

data.GSI = 0.09; units.GSI = 'g/g';  label.GSI = 'gonado somatic index'; bibkey.GSI = 'guess';
  temp.GSI = C2K(27.7); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Acanthurus nigrofuscus';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.924	12.775
0.961	12.141
0.997	17.845
0.998	13.409
0.999	11.719
1.034	14.254
1.071	15.627
1.958	14.881
1.995	18.050
2.032	16.148
2.033	16.570
2.919	21.635
2.956	18.782
2.957	17.198
2.993	18.043
2.994	16.881
3.066	20.049
3.067	19.521
3.068	16.035
3.990	16.134
4.025	15.289
4.026	17.718
4.027	18.458
4.028	20.676
4.029	21.944
4.030	23.000
4.064	16.873
4.065	19.725
4.101	18.985
4.102	21.204
4.103	22.471
4.914	16.656
4.951	21.092
4.952	17.395
4.986	23.521
4.987	19.719
4.988	15.916
5.025	21.725
5.062	22.465
5.099	20.140
5.911	18.761
5.948	21.825
5.983	19.500
5.984	19.923
5.985	20.874
5.986	21.507
5.987	22.564
6.022	23.937
6.096	17.809
7.057	19.704
12.968	22.937];
data.tL_f(:,1) = 365 * (.5 + data.tL_f(:,1));
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'females'};  
temp.tL_f    = C2K(27.7);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'TaylRhod2014'; comment.tL_f = 'Data from Guam';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.924	19.008
1.034	14.782
1.958	21.536
1.995	18.366
2.032	16.148
2.106	19.739
2.919	18.149
2.993	19.838
3.030	14.451
3.103	22.478
3.916	25.219
4.064	23.951
5.025	18.240
5.948	23.198
5.985	22.881
6.909	24.459
6.983	22.240
7.094	19.176
7.980	24.451
8.978	23.705
8.979	22.331];
data.tL_m(:,1) = 365 * (.5 + data.tL_m(:,1));
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'males'};  
temp.tL_m    = C2K(27.7);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'TaylRhod2014'; comment.tL_m = 'Data from Guam';

%% set weights for all real data
weights = setweights(data, []);
weights.GSI = 3 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.02512*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '45QGH'; % Cat of Life
metaData.links.id_ITIS = '172297'; % ITIS
metaData.links.id_EoL = '46577104'; % Ency of Life
metaData.links.id_Wiki = 'Naso_lituratus'; % Wikipedia
metaData.links.id_ADW = 'Naso_lituratus'; % ADW
metaData.links.id_Taxo = '46735'; % Taxonomicon
metaData.links.id_WoRMS = '219665'; % WoRMS
metaData.links.id_fishbase = 'Naso-lituratus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Naso_lituratus}}';
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
bibkey = 'TaylRhod2014'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jfb.12479}, ' ...
'author = {Taylor, B. M. and Rhodes, K. L. and Marshell, A. and McIlwain, J. L.}, ' ... 
'year = {2014}, ' ...
'title = {Age-based demographic and reproductive assessment of orangespine \emph{Naso lituratus} and blue spine \emph{Naso unicornis} unicornfishes}, ' ...
'journal = {Journal of Fish Biology}, ' ...
'volume = {85(3)}, ' ...
'pages = {901–916}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Naso-lituratus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Tuck1998'; type = 'Book'; bib = [ ...  
'author = {Tucker, J. W.}, ' ...
'year = {1998}, ' ...
'title  = {Marine Fish Culture}, ' ...
'publisher = {Springer-Science+Business Media}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
