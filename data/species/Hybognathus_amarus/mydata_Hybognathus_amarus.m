function [data, auxData, metaData, txtData, weights] = mydata_Hybognathus_amarus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Hybognathus_amarus'; 
metaData.species_en = 'Rio Grande silvery minnow'; 

metaData.ecoCode.climate = {'BWk','BSk'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biHa','biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'};  
metaData.data_1     = {'t-L_f'; 'L-N'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman', 'Starrlight Augustine'};        
metaData.date_subm = [2020 08 05];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 05]; 

%% set data
% zero-variate data

data.am = 5*365;   units.am = 'd';  label.am = 'life span';                 bibkey.am = 'CowlShir2006';   
  temp.am = C2K(22); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp = 4.0;    units.Lp = 'cm'; label.Lp = 'standard length at puberty';      bibkey.Lp = 'CaldFalc2019'; 
data.Li = 10;    units.Li = 'cm'; label.Li = 'ultimate standard length';         bibkey.Li = 'CaldFalc2019';
  
data.Wwb = 3.8e-4;  units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.9 mm: pi/6*0.09^3; see discussion';
data.Wwp = 0.97;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';     bibkey.Wwp = {'CaldFalc2019','fishbase'};
  comment.Wwi = 'based on 0.00708*(Lp/0.81)^3.08, see F1';
data.Wwi = 16.3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';        bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00708*(Li/0.81)^3.08, see F1';

%% univariate data
 
% time-length
data.tL = [ ... % time since birth (yr), std length (cm)
0.998	4.432
1.996	6.408
1.996	6.314
1.997	6.199
2.990	6.815
2.996	7.129
2.996	7.035
2.996	6.920
3.988	7.840
3.989	7.631
3.989	7.129
4.002	7.432
4.994	8.331];
data.tL(:,1) = 365 * (0.3 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length', 'wild'};  
temp.tL = C2K(22);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CowlShir2006'; 
comment.tL = 'Data from wild';

% time - length
data.tL1 = [ ... % time since birth (yr), std length (cm)
1 5.61
2 6.72
3 8.08
4 9.35];
data.tL1(:,1) = 365 * (0.5 + data.tL1(:,1));
units.tL1 = {'d', 'cm'}; label.tL1 = {'time since birth', 'standard length', 'culture'};  
temp.tL1 = C2K(22);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'CaldFalc2019'; 
comment.tL1 = 'Data from culture';

% length - fecundity
data.LN = [ ... % log10 std length (mm), log10 batch fecundity (#)
1.706	3.212
1.714	3.284
1.724	3.281
1.730	3.679
1.732	3.245
1.762	3.402
1.769	3.245
1.777	3.405
1.777	3.330
1.777	3.183
1.797	3.278
1.798	3.399
1.811	3.503
1.825	3.481
1.825	3.425
1.831	3.448
1.831	3.406
1.837	3.370
1.850	3.272
1.850	3.451
1.885	3.670
1.890	3.504
1.890	3.635
1.901	3.742
1.901	3.599
1.913	3.716
1.913	3.661
1.913	3.635
1.923	3.690
1.928	3.785
1.937	4.144
1.952	4.033
1.962	3.975
1.963	4.122
1.967	3.671
1.975	4.030
1.980	4.070
1.994	4.070
2.002	3.982];
data.LN = 10.^data.LN; % remoce log10 transformation
data.LN(:,1) = data.LN(:,1)/ 10; % convert mm to cm
units.LN = {'cm', '#'}; label.LN = {'standard length','fecundity','culture'};  
temp.LN = C2K(22);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'CaldFalc2019'; 
comment.LN = 'Data from culture';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL1','tL'}; subtitle1 = {'Data from culture, wild'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};


%% Discussion points
D1 = ['CowlShir2006 reports egg diameter of 3.8 mm, and CaldFalc2019 even upto 5.2 mm, while Wiki reports hatching within 1 d; this is inconsistent with LN data. ' ...
    'This entry assumes that extra water contributes to egg huge size and operational egg diameter is 0.9 mm'];
metaData.bibkey.D1 = {'CowlShir2006','CaldFalc2019','Wiki'};
D2 = 'Mean temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: W in g = 0.00708*(TL in cm)^3.08';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.81 * TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '3MY4V'; % Cat of Life
metaData.links.id_ITIS = '163365'; % ITIS
metaData.links.id_EoL = '211697'; % Ency of Life
metaData.links.id_Wiki = 'Hybognathus_amarus'; % Wikipedia
metaData.links.id_ADW = 'Hybognathus_amarus'; % ADW
metaData.links.id_Taxo = '176941'; % Taxonomicon
metaData.links.id_WoRMS = '1419452'; % WoRMS
metaData.links.id_fishbase = 'Hybognathus-amarus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Hybognathus_amarus}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
% 
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.in/summary/Hybognathus-amarus.html}}';  
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
bibkey = 'CowlShir2006'; type = 'Article'; bib = [ ... 
'doi = {10.1080/10641260500341494}, ' ...
'author = {David E. Cowley and Patrick D. Shirey and Michael D. Hatch}, ' ... 
'year = {2006}, ' ...
'title = {Ecology of the {R}io {G}rande Silvery Minnow ({C}yprinidae: \emph{Hybognathus amarus}) Inferred from Specimens Collected in 1874}, ' ...
'journal = {Reviews in Fisheries Science}, ' ...
'volume = {14(1-2)}, ' ...
'pages = {111-125}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CowlAlle2005'; type = 'techreport'; bib = [ ... 
'author = {David E. Cowley and Janelle Alleman and Ryan R. McShane and Patrick D. Shirey and Rossana Sallenave}, ' ... 
'year = {2005}, ' ...
'title = {Effects of sediment and salinity on physical properties of the egg of the {R}io {G}rande Silvery Minnow (\emph{Hybognathus Amarus})}, ' ...
'institute = {NEW MEXICO WATER RESOURCES RESEARCH INSTITUTE New Mexico State University}, ' ...
'volume = {334}, ' ...
'series = {WRRI Technical Completion Report}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CaldFalc2019'; type = 'Article'; bib = [ ... 
'doi = {10.1080/10641260500341494}, ' ...
'author = {Colleen A. Caldwell and Hunter Falco and William Knight and Manuel Ulibarri and William R. Gould}, ' ... 
'year = {2019}, ' ...
'title = {Reproductive Potential of Captive Rio Grande Silvery Minnow}, ' ...
'journal = {North American Journal of Aquaculture}, ' ...
'volume = {81}, ' ...
'pages = {47-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

