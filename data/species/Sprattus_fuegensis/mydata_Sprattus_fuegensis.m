  function [data, auxData, metaData, txtData, weights] = mydata_Sprattus_fuegensis

%% set other metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Clupeiformes'; 
metaData.family     = 'Clupeidae';
metaData.species    = 'Sprattus_fuegensis'; 
metaData.species_en = 'Falkland sprat'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0iMpe'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(7.8); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 06 02];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 06 02];

%% set data
% zero-variate data
data.am = 12*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'guess';   
  temp.am = C2K(7.8); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Sprattus sprattus';

data.Lp = 12;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'guess';
  comment.Lp = 'based on Sprattus sprattus';
data.Li = 18;    units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'fishbase';
  
data.Wwb = 5.1e-4;   units.Wwb = 'g';   label.Wwb = 'weight at birth';  bibkey.Wwb = 'fishbase';
  comment.Wwb = 'based on egg diameter of 0.99 mm: pi/6*0.099^3';
data.Wwp = 6.3;   units.Wwp = 'g';   label.Wwp = 'weight at puberty';  bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00347*Lp^3.02, see F1';
data.Wwi = 21.4;   units.Wwi = 'g';   label.Wwi = 'ultimate weight';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00347*Li^3.02, see F1';

data.Ri = 288*21.4/365;  units.Ri = '#/d';  label.Ri = 'maximum reprod rate';    bibkey.Ri = 'fishbase';   
  temp.Ri = C2K(7.8); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on relative fecundity of 288 eggs/g';
  
% uni-variate data 
% time-length
data.tL = [... % time since birth (d), standard length (cm)
0.972	15.004
0.972	13.926
0.972	12.900
0.973	10.333
0.974	9.255
0.982	14.388
0.982	13.413
0.982	12.386
0.983	11.924
0.991	15.569
0.993	11.411
0.993	11.000
1.003	9.923
1.011	15.980
1.967	18.048
1.968	15.943
1.969	13.428
1.970	12.504
1.970	11.990
1.979	15.019
1.979	14.454
1.979	14.095
1.979	13.017
1.988	16.508
1.988	15.481
1.990	10.810
1.990	10.348
1.997	17.432
1.998	16.919
2.000	11.631
2.974	18.678
2.975	17.600
2.975	16.984
2.976	15.496
2.984	18.063
2.985	16.574
2.986	14.880
2.986	13.904
3.005	15.958
3.006	14.418
3.972	18.026
3.972	17.461
3.972	17.102
3.983	15.459
4.001	18.539
4.002	16.537
4.012	15.922
4.979	17.938
4.979	16.962
4.999	17.373
5.986	17.542];
data.tL(:,1) = (data.tL(:,1) + 0.8) * 365; % convert yr to d
for i=2:size(data.tL,1); if data.tL(i,1)<=data.tL(i-1,1);data.tL(i,1)=data.tL(i-1,1)+1e-3;end;end
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
  temp.tL = C2K(7.8); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'CernLeal2014';

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

% % Group plots
% set1 = {'tL_1996','tL_1995'};subtitle1 = {'Dulc1998 data for 1996, 1995'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'weight-length: Ww in g = 0.00347*(TL in cm)^3.02';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4ZDQN'; % Cat of Life
metaData.links.id_ITIS = '551216'; % ITIS
metaData.links.id_EoL = '46562442'; % Ency of Life
metaData.links.id_Wiki = 'Sprattus_fuegensis'; % Wikipedia
metaData.links.id_ADW = 'Sprattus_fuegensis'; % ADW
metaData.links.id_Taxo = '42675'; % Taxonomicon
metaData.links.id_WoRMS = '272281'; % WoRMS
metaData.links.id_fishbase = 'Sprattus-fuegensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Sprattus_sprattus}}';  
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
bibkey = 'CernLeal2014'; type = 'Article'; bib = [ ...  
'doi = {103856/vol42-issue3-fulltext-15}, ' ...
'author = {Francisco Cerna and Elson Leal and Amalia L\''{o}pez and Guido Plaza}, ' ...
'year = {2014}, ' ...
'title = {Age, growth and natural mortality of the {P}atagonian sprat \emph{Sprattus fuegensis} ({J}enyns, 1842) in Chilo\''{e} inland sea, southern {C}hile}, ' ... 
'journal = {Lat. Am. J. Aquat. Res.}, ' ...
'volume = {42(3)}, '...
'pages = {580-587}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Sprattus-fuegensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
  
