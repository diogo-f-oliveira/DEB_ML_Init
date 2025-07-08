  function [data, auxData, metaData, txtData, weights] = mydata_Salvelinus_curilus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Salvelinus_curilus'; 
metaData.species_en = 'Southern Dolly Varden trout'; 

metaData.ecoCode.climate = {'Dfc'};
metaData.ecoCode.ecozone = {'THn', 'MPN'};
metaData.ecoCode.habitat = {'0jFr', 'jiMpe'};
metaData.ecoCode.embryo  = {'Fg'};
metaData.ecoCode.migrate = {'Mda'};
metaData.ecoCode.food    = {'biCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-L_f'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 26];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 26]; 

%% set data
% zero-variate data
data.am = 9*365;  units.am = 'd';   label.am = 'life span';              bibkey.am = 'KolpKim2014';   
  temp.am = C2K(5); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 23.5;     units.Lp = 'cm';  label.Lp = 'total length at puberty';bibkey.Lp = 'guess'; 
  comment.Lp = 'based on Salvelinus_namaycush';
data.Li = 75;    units.Li = 'cm';  label.Li = 'ultimate standard length';  bibkey.Li = 'fishbase';

data.Wwb = 2.76e-2; units.Wwb = 'g';   label.Wwb = 'wet weight at hatch';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 3.75 mm for Salvelinus_malma: pi/6*0.375^3';
  
data.Ri = 450/365; units.Ri = '#/d'; label.Ri = 'maximum reprod rate';   bibkey.Ri = 'guess';   
  temp.Ri = C2K(5);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
    
% uni-variate data
% time-length
data.tL_PR = [... % time since birth (yr), fork length (cm)
3.506	25.036
4.518	29.029
5.500	34.964
6.492	41.871
7.505	45.647
8.486	51.799
9.509	54.496];
data.tL_PR(:,1) = 365 * (0.75 + data.tL_PR(:,1)); % convert yr to d
units.tL_PR = {'d', 'cm'};     label.tL_PR = {'time since birth', 'fork length', 'Petrovka River, anadromous form'};  
temp.tL_PR = C2K(5); units.temp.tL_PR = 'K'; label.temp.tL_PR = 'temperature';
bibkey.tL_PR = 'KolpKim2014';
comment.tL_PR = 'Petrovka River, anadromous form';
%
data.tL_SR = [... % time since birth (yr), fork length (cm)
1.020	6.906
1.992	9.496
3.005	11.223
4.017	16.403
4.989	19.209
5.991	22.338
7.003	25.683
8.016	27.194];
data.tL_SR(:,1) = 365 * (0.75 + data.tL_SR(:,1)); % convert yr to d
units.tL_SR = {'d', 'cm'};     label.tL_SR = {'time since birth', 'fork length', 'Samarga River, land-locked river form'};  
temp.tL_SR = C2K(5); units.temp.tL_SR = 'K'; label.temp.tL_SR = 'temperature';
bibkey.tL_SR = 'KolpKim2014';
comment.tL_SR = 'Samarga River, land-locked river form';
%
data.tL_SB = [... % time since birth (yr), fork length (cm)
1.010	5.719
2.023	9.173
3.025	11.763
4.007	13.273
5.009	15.108];
data.tL_SB(:,1) = 365 * (0.75 + data.tL_SB(:,1)); % convert yr to d
units.tL_SB = {'d', 'cm'};     label.tL_SB = {'time since birth', 'fork length', 'Samarga brook, land-locked brook form'};  
temp.tL_SB = C2K(5); units.temp.tL_SB = 'K'; label.temp.tL_SB = 'temperature';
bibkey.tL_SB = 'KolpKim2014';
comment.tL_SB = 'Samarga brook, land-locked brook form';


% length-weight
data.LW = [... % fork length (cm), wet weight (g)
    16.0 50.5
    12.5 21.2
    14.1 31.5
    12.8 24.0
    10.7 13.2
    28.2 260.0];
units.LW = {'cm', 'g'};     label.LW = {'fork length', 'wet weight'};  
bibkey.LW = 'KolpKim2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_PR = 3 * weights.tL_PR;
weights.tL_SR = 3 * weights.tL_SR;
weights.tL_SB = 3 * weights.tL_SB;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_PR','tL_SR','tL_SB'}; subtitle1 = {'Data for Petrovka R (anadr), Samarga R & brook (land-lock)'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'temperatures are guessed; known as a cold-water species';
metaData.discussion = struct('D1', D1);
                                 
%% Links
metaData.links.id_CoL = '6XG34'; % Cat of Life
metaData.links.id_ITIS = '623518'; % ITIS
metaData.links.id_EoL = '212741'; % Ency of Life
metaData.links.id_Wiki = 'Salvelinus_curilus'; % Wikipedia
metaData.links.id_ADW = 'Salvelinus_curilus'; % ADW
metaData.links.id_Taxo = '932933'; % Taxonomicon
metaData.links.id_WoRMS = '1026965'; % WoRMS
metaData.links.id_fishbase = 'Salvelinus-curilus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Salvelinus_curilus}}';  
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
bibkey = 'KolpKim2014'; type = 'Article'; bib = [ ...  
'doi = {10.1134/S0032945214040055}, ' ...
'author = {N. V. Kolpakov and L. N. Kim and P. G. Milovankin}, ' ...
'year = {2014}, ' ...
'title = {Landlocked {S}outh {A}sian {D}olly {V}arden Char \emph{Salvelinus curilus} ({S}almonidae) from the {B}asin of {P}etrovskoe {R}eservoir ({P}etrovka {R}iver, {P}rimorye)}, ' ... 
'journal = {Journal of Ichthyology}, ' ...
'volume = {54}, '...
'pages = {428-432}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Salvelinus-curilus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
