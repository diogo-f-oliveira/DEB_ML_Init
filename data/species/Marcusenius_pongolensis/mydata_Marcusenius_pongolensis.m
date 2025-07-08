  function [data, auxData, metaData, txtData, weights] = mydata_Marcusenius_pongolensis
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Osteoglossiformes'; 
metaData.family     = 'Mormyridae';
metaData.species    = 'Marcusenius_pongolensis'; 
metaData.species_en = 'Southern bulldog'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biFr'};
metaData.ecoCode.embryo  = {'Fbm'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biPz','biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 
metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 08 17];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 08 17];

%% set data
% zero-variate data
data.ab = 13; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(26.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'BootKhum2010';   
  temp.am = C2K(26.3);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 11.9;     units.Lp = 'cm';   label.Lp = 'total length at puberty';bibkey.Lp = 'BootKhum2010';
data.Li = 26;     units.Li = 'cm';   label.Li = 'ultimate total length';  bibkey.Li = 'BootKhum2010';

data.Wwb = 3.1e-3;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.8 mm: pi/6*0.18^3';
data.Wwp = 10.7;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = {'BootKhum2010','fishbase'};
  comment.Wwp = 'based on 0.00562*Lp^3.05, see F1';
data.Wwi = 116;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = {'BootKhum2010','fishbase'};
  comment.Wwi = 'based on 0.00562*Li^3.05, see F1';
  
data.Ri = 8e3/365;       units.Ri = '#/d';  label.Ri = 'max reprod rate';     bibkey.Ri = 'guess';
  temp.Ri = C2K(26.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
  comment.Ri = 'based on kap=0.87 of Mormyrus_kannume';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (cm)
0.010	17.349
0.011	12.392
0.012	10.884
0.034	11.853
0.939	18.103
0.960	19.828
0.961	19.612
0.963	16.810
0.966	12.823
0.967	11.961
0.968	11.207
0.986	16.056
1.002	23.060
1.007	16.918
1.026	20.259
1.938	20.151
1.955	25.216
1.958	21.228
1.959	20.797
1.961	17.996
1.962	17.565
1.963	16.056
1.964	15.409
1.982	19.828
1.985	16.918
2.003	21.659
2.006	18.534
2.025	22.306
2.027	19.073
2.957	22.522
2.958	21.983
2.959	21.013
2.982	20.366
2.983	17.996
2.984	17.457
2.985	17.134
3.007	16.703
3.008	16.056
3.027	19.828
3.940	17.457
3.941	16.164
3.963	16.703
3.979	23.060
3.980	22.522
3.983	19.397
4.000	24.892
4.045	24.246
4.933	25.647
4.934	24.677
4.962	17.349
4.983	18.534
4.984	17.672
5.957	23.707
5.958	23.168
6.954	26.940
6.982	20.582];
data.tL(:,1) = (data.tL(:,1) + 0.5) * 365; % convert yr to d
units.tL = {'d', 'cm', 'g'};  label.tL = {'time since birth', 'length', 'weight'};  
temp.tL = C2K(26.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BootKhum2010';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Ri = weights.Ri * 0;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.00562*(TL in cm)^3.05'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3Y39Q'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '11072479'; % Ency of Life
metaData.links.id_Wiki = 'Marcusenius'; % Wikipedia
metaData.links.id_ADW = 'Marcusenius_pongolensis'; % ADW
metaData.links.id_Taxo = '457372'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_fishbase = 'Marcusenius_pongolensis'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Marcusenius}}';  
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
bibkey = 'BootKhum2010'; type = 'Article'; bib = [ ...
'author = {Anthony J. Booth and Nokuthula Khumalo}, ' ...
'year = {2010}, ' ...
'title = {Age, growth and reproduction of \emph{Marcusenius pongolensis}, \emph{Oreochromis mossambicus} and \emph{Schilbe intermedius} in anoligotrophic impoundment in {S}waziland}, ' ... 
'journal = {African Journal of Ecology}, ' ...
'volume = {48}, '...
'pages = {285-568}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Marcusenius-pongolensis.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

