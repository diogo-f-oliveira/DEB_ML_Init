  function [data, auxData, metaData, txtData, weights] = mydata_Coregonus_nasus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Salmoniformes'; 
metaData.family     = 'Salmonidae';
metaData.species    = 'Coregonus_nasus'; 
metaData.species_en = 'Broad whitefish'; 

metaData.ecoCode.climate = {'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0jFl'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(6); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 10 10];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 10 10]; 

%% set data
% zero-variate data
data.am = 15*365;   units.am = 'd';  label.am = 'life span';            bibkey.am = 'fishbase';   
  temp.am = C2K(6); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 35;  units.Lp = 'cm'; label.Lp = 'total length at puberty'; bibkey.Lp = 'fishbase'; 
  comment.Lp = 'based on tp 5-9 yr and tL data';
data.Li = 71;  units.Li = 'cm'; label.Li = 'ultimate total length';   bibkey.Li = 'fishbase';

data.Wwb = 6e-3;   units.Wwb = 'g';  label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'ADW';
  comment.Wwb = 'Computed from egg diameter of 2-3 mm of Coregonus kiyi: pi/6*0.225^3';
data.Wwp = 475;   units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00525*Lp^3.21, see F1';
data.Wwi = 4.6e3;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';       bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00525*Li^3.21, see F1';
    
data.Ri = 14e4/365; units.Ri = '#/d';  label.Ri = 'max reprod rate';   bibkey.Ri = 'ADW';
  temp.Ri = C2K(6); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% univariate data

% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.018	6.177
0.018	8.709
0.926	11.241
1.017	9.519
1.035	8.203
1.961	15.899
1.997	14.785
2.015	14.076
2.995	20.557
2.995	21.063
2.995	21.671
3.958	25.114
3.958	26.734
4.012	24.810
5.011	28.354
5.011	28.253
5.011	27.848
5.991	31.190
5.991	29.570
5.991	28.759
6.971	31.595
6.971	30.684
8.006	36.658
8.042	32.810
9.041	36.354
9.077	33.823
10.003	40.000
10.021	34.025
10.021	37.772
10.983	43.038
11.002	35.139
11.020	38.886
11.982	35.139
12.000	40.810
12.018	43.544];
data.tL(:,1) = 365 * (0.9 + data.tL(:,1)); % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(6);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GrifGall1992';

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


%% Discussion points
D1 = 'males are assumed not to differ from females due to lack of data';
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'length-weight: W in g = 0.00525*(TL in cm)^3.21';
metaData.bibkey.F1 = 'fishbase';
F2 = 'length-length from photo: SL = 0.85*TL';
metaData.bibkey.F2 = 'fishbase';
metaData.facts = struct('F1',F1, 'F2',F2); 

%% Links
metaData.links.id_CoL = '6B29W'; % Cat of Life
metaData.links.id_ITIS = '161936'; % ITIS
metaData.links.id_EoL = '46563179'; % Ency of Life
metaData.links.id_Wiki = 'Coregonus_nasus'; % Wikipedia
metaData.links.id_ADW = 'Coregonus_nasus'; % ADW
metaData.links.id_Taxo = '42847'; % Taxonomicon
metaData.links.id_WoRMS = '274342'; % WoRMS
metaData.links.id_fishbase = 'Coregonus-nasus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Coregonus_nasus}}';  
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
bibkey = 'GrifGall1992'; type = 'Article'; bib = [ ...  
'doi = {10.1577/1548-8659(1992)121<0557:GACOAC>2.3.CO;2}, ' ...
'author = {William B. Griffiths and Benny J. Gallaway and William J. Gazey and Robert E. Dillinger}, ' ...
'year = {1992}, ' ...
'title = {Growth and Condition of {A}rctic Cisco and Broad Whitefish as Indicators of Causeway-Induced Effects in the {P}rudhoe {B}ay {R}egion, {A}laska}, ' ... 
'journal = {Transactions of the American Fisheries Society}, ' ...
'pages = {557-577}, ' ...
'volume = {121(5)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Coregonus-nasus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Coregonus_kiyi}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

