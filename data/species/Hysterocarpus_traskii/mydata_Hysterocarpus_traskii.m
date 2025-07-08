function [data, auxData, metaData, txtData, weights] = mydata_Hysterocarpus_traskii
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'OvalentariaIncSed'; 
metaData.family     = 'Embiotocidae';
metaData.species    = 'Hysterocarpus_traskii'; 
metaData.species_en = 'Tule perch'; 

metaData.ecoCode.climate = {'Csa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl','0iFr'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'}; 
metaData.data_1     = {'t-L'; 'Ww-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2020 09 21]; 
metaData.email    = {'bas.kooijman@vu.nl'}; 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 21]; 

%% set data
% zero-variate data

data.am = 5*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'fishbase';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 7.3; units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females'; bibkey.Lp  = 'guess'; 
data.Li  = 15.0;  units.Li  = 'cm';  label.Li  = 'ultimate standard length for females'; bibkey.Li  = 'fishbase';

% uni-variate data
% time-length data 
data.tL = [ ... % time (d), total length (cm)
0       3.7
0.074	4.012
0.526	9.292
1.013	10.785
1.536	12.709
2.024	13.775
3.012	14.788];
data.tL(:,1) = 365 * data.tL(:,1); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Bund1970';

% time-weight data 
data.tWw = [ ... % time (d), wet weight (g)
0.518	33.852
1.029	43.478
1.538	66.996
2.048	89.445
3.046	112.599];
data.tWw(:,1) = 365 * data.tWw(:,1); % convert yr to d
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(18);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Bund1970';

% weight fecundity
data.WN = [ ... % time since birth (d), standard length (cm)
    41   26.3
    86   44
   126.6 65];
units.WN   = {'g', '#'};  label.WN = {'wet weight', 'fecundity'};  
temp.WN    = C2K(18);  units.temp.WN = 'K'; label.temp.WN = 'temperature';
bibkey.WN = 'Bund1970';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'Viviparous';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'length-length from photo: SL = 0.83*TL';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '6N573'; % Cat of Life
metaData.links.id_ITIS = '553322'; % ITIS
metaData.links.id_EoL = '46572854'; % Ency of Life
metaData.links.id_Wiki = 'Hysterocarpus_traskii'; % Wikipedia
metaData.links.id_ADW = 'Hysterocarpus_traskii'; % ADW
metaData.links.id_Taxo = '177388'; % Taxonomicon
metaData.links.id_WoRMS = '293619'; % WoRMS
metaData.links.id_fishbase = 'Hysterocarpus-traskii'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hysterocarpus_traskii}}';
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
bibkey = 'Bund1970'; type = 'phdthesis'; bib = [ ... 
'author = {David Scott Bundy}, ' ... 
'year = {1970}, ' ...
'title = {Reproduction and growth of the Tule perch \emph{Hysterocarpus traskii} (Gibbons) with notes on its ecology}, ' ...
'school = {University of the Pacific}, ' ...
'howpublished = {\url{https://scholarlycommons.pacific.edu/uop_etds/1717}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Hysterocarpus-traskii.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
