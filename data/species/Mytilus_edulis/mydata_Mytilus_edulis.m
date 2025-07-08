function [data, auxData, metaData, txtData, weights] = mydata_Mytilus_edulis

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Mytiloida'; 
metaData.family     = 'Mytilidae';
metaData.species    = 'Mytilus_edulis'; 
metaData.species_en = 'Blue mussel'; 

metaData.ecoCode.climate = {'MC', 'ME'};
metaData.ecoCode.ecozone = {'MAN', 'MPN', 'MN'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Da'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp';	'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-dL'; 'L-Ww'; 'X-JX_L'; 'X-JP_L'; 'JX-JO_L'; 'L-JO'}; 

metaData.COMPLETE = 3.8; % using criteria of LikaKear2011

metaData.author   = {'Sofia Saraiva'};   
metaData.date_subm = [2010 11 11];           
metaData.email    = {'Sofia.Saraiva@nioz.nl'};  
metaData.address  = {'NIOZ, Texel'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2015 12 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2017 11 11];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 11]; 

%% set data
% zero-variate data

data.ab = 0.2;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Newe1989';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Newe1989';
  temp.tp = C2K(18);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 24*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'RodhRode1984';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.009; units.Lb  = 'cm';  label.Lb  = 'shell height at birth';   bibkey.Lb  = 'Newe1989';
  comment.Lb = 'shell height is from umbo to ventral margin';
data.Lp  = 1.2;   units.Lp  = 'cm';  label.Lp  = 'shell height at puberty'; bibkey.Lp  = 'VeerCard2006';
data.Li  = 15;    units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'VeerCard2006';

data.Wwb = 2.69e-8;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'Based on .03693*Lb^3 from HareKooy1993';
data.Wwp = 6.38e-2;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'guess';
  comment.Wwp = 'Based on .03693*Lp^3 from HareKooy1993';
data.Wwi = 124.6;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on .03693*Li^3 from HareKooy1993';

data.Ri  = 2e6/354;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'HonkMeer1998';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

data.GSI  = 0.2; units.GSI  = '-'; label.GSI  = 'gonado somatic index';     bibkey.GSI  = 'CardDekk2007';   
  temp.GSI = C2K(12);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% total particulate matter - pseudo faeces production
% length[cm] food[mgC/l] InorganicMaterial[mg/l] Pseudofaeces[mgdw/h] TPM[mgdw/l]					
Data01 = [ ... % [cm], [mgC/l], [mg/l], [mgdw/h], [mgdw/l]
                    7  0.24       12.91   16.27949 13.39;
                    7  0.24	      15.76   23.19849 16.24;
                    7  0.24	      48.32  114.7735  48.80;
                    7  0.24	      52.80   91.57449 53.28;
                    7  0.24	      72.74  119.6575  73.22;
                    7  0.24	      93.50  171.3465  93.98;
                    7  0.24	     116.70  153.8455  117.18;
                    7  0.24	     197.29  242.1645  197.77;
                    7  0.24	     258.34  231.1755  258.82;
                    7  0.24	     278.69  196.1735  279.17];
                
% total particulate matter - ingestion rate
% length[cm] food[mgC/l] pom[mgC/l] InorganicMaterial[mg/l] Clearancerate[l/h] TPM[mgdw/l]  TotalIngestionRate[mgdw/h]					
Data02 = [ ...%[cm],[mgC/l],[mgC/l],[mg/l],[l/h],[mgdw/l],[mgdw/h]
                3.7	  0.080   0.042    2.00	 2.81   2.30	 1.86;
                3.7	  0.080   0.068    3.23	 3.12   3.60	 2.34;
                3.7	  0.080   0.198    9.41	 2.60  10.10	 2.7;
                3.7	  0.080   0.49	  23.28  2.20  24.70	 2.4;
                3.7	  0.080   1.11	  52.82  1.90  55.80	 3];
            
% total particulate matter - ingestion, pseudofaeces and faeces production
%  food[mgC/l] pom[mgC/l] InorganicMaterial[mg/l] TPM[mgdw/l] Clearancerate[l/h]  AlgaeIngestionRate[microChla/h] Pseudofaeces[mgdw/h] AlgaeFaecesContri[microChla/h]					
Data03to5 = [ ...%[mgC/l], [mgC/l], [mg/l], [mgdw/l], [l/h], [microChla/h], [mgdw/h], [microChla/h]					
                    0.22	0.11	 3.97	 4.8	0.62 3.1    1.8  0.43;
                    0.22	0.22	 7.68	 8.8	0.38 1.86   2.1	 0.15;
                    0.18	0.50	17.21	18.9	0.47 1.28   6.7	 0.24;
                    0.19	0.62	21.38	23.4	0.68 2.71  13.2	 0.3;
                    0.15	2.01	69.49	74.9	0.28 0.23  19.8	 0.06;
                    0.15	2.31	79.93	86.1	0.3	 0.06  24.3	 0.06];

data.SJXp_WiddFiet1979 = Data01(:,[3 4]);
units.SJXp_WiddFiet1979   = {'mg/l', 'mgdw/h'};  label.SJXp_WiddFiet1979 = {'Tot Part Matter', 'pseudofaeces prod'};  
temp.SJXp_WiddFiet1979    = C2K(15);  units.temp.SJXp_WiddFiet1979 = 'K'; label.temp.SJXp_WiddFiet1979 = 'temperature';
bibkey.SJXp_WiddFiet1979 = 'WiddFiet1979';
comment.SJXp_WiddFiet1979 = '7cm shell height, 0.24 mgC/l food density';
   
data.SJXp_PrinSmaa1991 = Data03to5(:,[4 7]);
units.SJXp_PrinSmaa1991   = {'mg/l', 'mgdw/h'};  label.SJXp_PrinSmaa1991 = {'Tot Part Matter', 'pseudofaeces prod'};  
temp.SJXp_PrinSmaa1991    = C2K(6.5);  units.temp.SJXp_PrinSmaa1991 = 'K'; label.temp.SJXp_PrinSmaa1991 = 'temperature';
bibkey.SJXp_PrinSmaa1991 = 'PrinSmaa1991';
comment.SJXp_PrinSmaa1991 = '6cm shell height, 0.22-0.15 mgC/l food density';
            
            
data.SJX_KiorMohl1980 = Data02(:,[6 7]);
units.SJX_KiorMohl1980   = {'mgdw/l', 'mgdw/h'};  label.SJX_KiorMohl1980 = {'Tot Part Matter', 'ingestion rate'};  
temp.SJX_KiorMohl1980    = C2K(15);  units.temp.SJX_KiorMohl1980 = 'K'; label.temp.SJX_KiorMohl1980 = 'temperature';
bibkey.SJX_KiorMohl1980 = 'KiorMohl1980';
comment.SJX_KiorMohl1980 = '3.7 cm shell height, 0.08 mgC/l food density';
                                
%                            
data.SJX_PrinSmaa1991 = Data03to5(:,[4 6]);
units.SJX_PrinSmaa1991   = {'mgdw/l', 'mugChla/h'};  label.SJX_PrinSmaa1991 = {'Tot Part Matter', 'ingestion rate'};  
temp.SJX_PrinSmaa1991    = C2K(6.5);  units.temp.SJX_PrinSmaa1991 = 'K'; label.temp.SJX_PrinSmaa1991 = 'temperature';
bibkey.SJX_PrinSmaa1991 = 'PrinSmaa1991';
comment.SJX_PrinSmaa1991 = '6cm shell height, 0.22-0.15 mgC/l food density';
%
data.SJP_PrinSmaa1991 = Data03to5(:,[4 8]);
units.SJP_PrinSmaa1991   = {'mgdw/l', 'mugChla/h'};  label.SJP_PrinSmaa1991 = {'Tot Part Matter', 'faeces prod rate'};  
temp.SJP_PrinSmaa1991    = C2K(6.5);  units.temp.SJP_PrinSmaa1991 = 'K'; label.temp.SJP_PrinSmaa1991 = 'temperature';
bibkey.SJP_PrinSmaa1991 = 'PrinSmaa1991';
comment.SJP_PrinSmaa1991 = '6cm shell height, 0.22-0.15 mgC/l food density';

% length - O2 consumption
data.LJO = [ ... % shell height[cm], dioxygen consumption rate[cm3O2/h]
	1.62	0.017;
	1.88	0.026;
	1.93	0.057;
	1.96	0.021;
	2.15	0.035;
	2.32	0.021;
	2.38	0.024;
	2.39	0.052;
	2.51	0.038;
	2.60	0.050;
	2.61	0.061;
	2.91	0.071;
	3.08	0.054;
	3.39	0.108;
	3.80	0.200;
	3.81	0.212;
	3.82	0.160;
	3.92	0.142;
	3.94	0.278;
	4.22	0.380;
	4.23	0.408;
	4.46	0.368;
	4.54	0.252;
	4.59	0.177;
	4.62	0.488;
	4.69	0.226;
	5.23	0.335;
	5.53	0.184;
	6.10	0.328];
data.LJO(:,2) = data.LJO(:,2) * 24/22.4e3; % convert cm3/h to mol/d
units.LJO   = {'cm', 'mol/d'};  label.LJO = {'shell height', 'O2 consumption'};  
temp.LJO    = C2K(15);  units.temp.LJO = 'K'; label.temp.LJO = 'temperature';
bibkey.LJO = 'Krug1960';
comment.LJO = 'from HareKooy1993, Fig.8';

% ingestion rate - O2 consumption for 2 lengths
data.JXJO_25 = [ ... % Ingestion_Rate[mgPOM/h] Oxygen_Consumption_Rate[cm3O2/h]
	0.3643	0.028;
	0.4157	0.033;
	0.4543	0.039;
	0.5014	0.042;
	0.7886	0.050;
	0.8400	0.065];
data.JXJO_25(:,1) = data.JXJO_25(:,1) * 24/ 12e3;   % convert mgPOM/h to Cmol/d
data.JXJO_25(:,2) = data.JXJO_25(:,2) * 24/ 22.4e3; % convert cm3/h to mol/d
units.JXJO_25   = {'Cmol/d', 'mol O2/d'};  label.JXJO_25 = {'ingestion rate', 'O2 consumption'};  
temp.JXJO_25    = C2K(15);  units.temp.JXJO_25 = 'K'; label.temp.JXJO_25 = 'temperature';
bibkey.JXJO_25 = 'BaynHawk1987';
comment.JXJO_25 = 'shell height is 2.5 cm; from HareKooy1993, Fig.9';
%
data.JXJO_45 = [ ... % Ingestion_Rate[mgPOM/h] Oxygen_Consumption_Rate[cm3O2/h]
	0.3600	0.109;
	0.4543	0.157;
	0.5486	0.143;
	0.5957	0.147;
	0.7886	0.155;
	0.9043	0.185];
data.JXJO_45(:,1) = data.JXJO_45(:,1) * 24/ 12e3;   % convert mgPOM/h to Cmol/d
data.JXJO_45(:,2) = data.JXJO_45(:,2) * 24/ 22.4e3; % convert cm3/h to mol/d
units.JXJO_45   = {'Cmol/d', 'mol O2/d'};  label.JXJO_45 = {'ingestion rate', 'O2 consumption'};  
temp.JXJO_45    = C2K(15);  units.temp.JXJO_45 = 'K'; label.temp.JXJO_45 = 'temperature';
bibkey.JXJO_45 = {'BaynHawk1987','BaynHawk1989'};
comment.JXJO_45 = 'shell height is 4.5 cm; from HareKooy1993, Fig.9';

% time-length data at several areal exposure levels
data.tL_0 = [ ... %  time since birth (a), shell height (mm) 
    0.92 6.16;
    1.85 15.13;
    3.09 26.74;
    3.95 33.20;
    5.05 39.21;
    6.03 46.41;
    7.00 50.51;
    7.98 57.11;
    9.12 59.74;
    9.91 63.99;
    11.06 68.82;
    11.96 72.78;
    12.98 76.14;
    14.10 74.64;
    15.15 71.38;
    15.96 80.79;
    17.07 77.96;
    17.93 84.42;
    19.03 78.65;
    19.95 84.81;
    22.09 87.56;
    23.16 89.30;
    24.00 90.90];
data.tL_0(:,1) = data.tL_0(:,1) * 365; % convert a to d
data.tL_0(:,2) = data.tL_0(:,2)/ 10; % convert mm to cm
units.tL_0   = {'d', 'cm'};  label.tL_0 = {'time since birth', 'shell height', '0% aerial exposure'};  
temp.tL_0    = C2K(12);  units.temp.tL_0 = 'K'; label.temp.tL_0 = 'temperature';
bibkey.tL_0 = 'RodhRode1984';
comment.tL_0 = '0% aerial exposure';
%
data.tL_13 = [ ... %  time since birth (a), shell height (mm) 
    0.86 6.75;
    1.85 15.72;
    3.87 28.63;
    4.97 34.94;
    5.88 39.19;
    6.97 45.20;
    7.92 46.07;
    8.94 48.40;
    9.84 50.44;
    10.86 54.83;
    12.02 60.85;
    12.96 59.64;
    13.87 64.63;
    15.09 60.62;
    15.94 65.46];
data.tL_13(:,1) = data.tL_13(:,1) * 365; % convert a to d
data.tL_13(:,2) = data.tL_13(:,2)/ 10; % convert mm to cm
units.tL_13   = {'d', 'cm'};  label.tL_13 = {'time since birth', 'shell height', '13% aerial exposure'};  
temp.tL_13    = C2K(12);  units.temp.tL_13 = 'K'; label.temp.tL_13 = 'temperature';
bibkey.tL_13 = 'RodhRode1984';
comment.tL_13 = '13% aerial exposure';
%
data.tL_33 = [ ... %  time since birth (yr), shell height (mm) 
    0.93 8.08;
    1.85 13.95;
    2.81 18.35;
    3.90 22.00;
    4.99 27.87;
    6.08 31.82;
    6.98 34.60;
    7.94 37.67;
    9.13 40.29;
    9.97 42.63;
    10.92 43.49;
    11.95 46.85;
    13.08 49.47];
data.tL_33(:,1) = data.tL_33(:,1) * 365; % convert a to d
data.tL_33(:,2) = data.tL_33(:,2)/ 10; % convert mm to cm
units.tL_33   = {'d', 'cm'};  label.tL_33 = {'time since birth', 'shell height', '33% aerial exposure'};  
temp.tL_33    = C2K(12);  units.temp.tL_33 = 'K'; label.temp.tL_33 = 'temperature';
bibkey.tL_33 = 'RodhRode1984';
comment.tL_33 = '33% aerial exposure';	
    
% length - wet weight
data.LW = [ ... % Shell_Length[cm] Wet_Weight[g]
	1.77	0.16;				
	1.92	0.27;				
	2.14	0.32;				
	2.65	1.12;				
	2.80	0.72;				
	3.32	1.34;				
	3.47	1.34;				
	3.47	1.97;				
	4.09	2.48;				
	4.09	3.05;				
	4.20	2.31;				
	4.87	3.10;				
	5.20	3.84;				
	5.46	4.29;				
	5.46	4.52;				
	5.09	4.52;				
	5.01	4.75;				
	5.24	4.98;				
	5.46	6.00;				
	5.60	6.34;				
	5.49	6.40;				
	5.75	6.46;				
	5.90	6.57;				
	5.79	7.37;				
	5.94	7.60;				
	5.97	7.82;				
	6.05	9.93;				
	6.27	9.99;				
	6.75	10.56;				
	6.60	10.73;				
	6.64	10.90;				
	6.86	11.07;				
	6.71	11.18;			
	6.53	11.41;			
	6.49	11.98;			
	6.67	11.75;			
	6.78	11.70;			
	6.93	11.64];
units.LW   = {'cm', 'g'};  label.LW = {'shell height', 'wet weight'};  
bibkey.LW = {'Borc1985','PietKluy1979'};
comment.LW = 'from HareKooy1993, Fig.1';

% time - change in length during starvation
data.tdL = [ ... % time since birth [d], Shell_Length_growth[mm/d]
	0.0	0.17;	
	0.5	0.15;	
	1.0	0.11;
	1.5	0.09;	
	2.0	0.07;	
	2.5	0.05;	
	3.0	0.03;	
	3.5	0.02;	
	4.0	0.02;	
	4.5	0.01;	
	5.0	0.01;	
	5.5	0.01];
data.tdL(:,2) = data.tdL(:,2)/ 10; % convert mm/d to cm/d
units.tdL   = {'cm', 'cm/d'};  label.tdL = {'shell height', 'growth'};  
temp.tdL    = C2K(21.8);  units.temp.tdL = 'K'; label.temp.tdL = 'temperature';
bibkey.tdL = 'StroCary1984';
comment.tdL = 'initial length is 1.7 cm and no food; from HareKooy1993, Fig.13';

%% set weights for all real data
weights = setweights(data, []);
weights.SJXp_PrinSmaa1991 = weights.SJXp_PrinSmaa1991 .* (data.SJXp_PrinSmaa1991(:,2) > 5);
weights.SJX_KiorMohl1980 = weights.SJX_KiorMohl1980 * 0; % a factor 100 too high
weights.Wwi = 50 * weights.Wwi;
weights.GSI = 0 * weights.GSI;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'SJXp_WiddFiet1979','SJXp_PrinSmaa1991'}; subtitle1 = {'Data from WiddFiet1979, PrinSmaa1991'};
set2 = {'JXJO_45','JXJO_25'}; subtitle2 = {'Data from 4.5, 2.5 shell height'};
set3 = {'tL_0','tL_13','tL_33'}; subtitle3 = {'Data at 0%, 13%, 33% areal exposure'};
metaData.grp.sets = {set1,set2,set3};
metaData.grp.subtitle = {subtitle1,subtitle2,subtitle3};

%% Discussion points
D1 = 'The JX data of KiorMohl1980 is a factor 100 too high, for unknown reasons; the clearance rate times particle conc is not near the ingestion rate';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'Reproduction rate is inconsistent with GSI and GSI is given weight zero';
metaData.discussion = struct('D1', D1, 'D2', D2, 'D3', D3);

%% Facts
F1 = 'This entry is discussed in SaraMeer2011, SaraMeer2011a, SaraMeer2012, Sara2014';
metaData.bibkey.F1 = {'SaraMeer2011','SaraMeer2011a','SaraMeer2012','Sara2014'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '73T5L'; % Cat of Life
metaData.links.id_ITIS = '79454'; % ITIS
metaData.links.id_EoL = '46466840'; % Ency of Life
metaData.links.id_Wiki = 'Mytilus_edulis'; % Wikipedia
metaData.links.id_ADW = 'Mytilus_edulis'; % ADW
metaData.links.id_Taxo = '39226'; % Taxonomicon
metaData.links.id_WoRMS = '140480'; % WoRMS
metaData.links.id_molluscabase = '140480'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Mytilus_edulis}}';
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
bibkey = 'Newe1989'; type = 'Article'; bib = [ ... 
'author = {Newell, R.}, ' ... 
'year = {1989}, ' ...
'title = {Species profiles: life histories and environmental requirements of coastal fiches and invertebrates ({N}orth and {M}id-{A}tlantic): blue mussel}, ' ...
'journal = {U.S. Fish. Wildl. Serv. Biol. Rep.; U.S. Army Corps of Engineers}, ' ...
'volume = {82 (11.102)}, ' ...
'number = {TR E1-82-4}, '...
'pages = {25}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HareKooy1993'; type = 'Article'; bib = [ ... 
'author = {Haren, R. van and Kooijman, S. A. L. M.}, ' ... 
'year = {1993}, ' ...
'title = {Application of a {D}ynamic {E}nergy {B}udget model to \emph{Mytilus edulis} ({L}.)}, ' ...
'journal = {Neth. J. Sea Res.}, ' ...
'volume = {31}, ' ...
'pages = {119-133}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'VeerCard2006'; type = 'Article'; bib = [ ... 
'author = {Veer, H. van der and Cardoso, J. F. and Meer, J. van der}, ' ... 
'year = {2006}, ' ...
'title = {The estimation of {D}{E}{B} parameters for various northeast {A}tlantic bivalve species}, ' ...
'journal = {Journal of Sea Research}, ' ...
'volume = {56}, ' ...
'pages = {107-124}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CardDekk2007'; type = 'Article'; bib = [ ... 
'author = {Cardoso, J. and Dekker, R. and Witte, J. and van der Veer, H.}, ' ... 
'year = {2007}, ' ...
'title = {Is reproductive failure responsible for reduced recruitment of intertidal \emph{Mytilus edulis} {L}. in the western {D}utch {W}adden {S}eap {S}enckenberg}, ' ...
'journal = {Mar. Biol.}, ' ...
'volume = {37}, ' ...
'pages = {83-92}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaraMeer2011a'; type = 'Article'; bib = [ ... 
'author = {Saraiva, S. and van der Meer, J. and Kooijman, S. A. L. M. and Sousa, T.}, ' ... 
'year = {2011}, ' ...
'title = {Modelling feeding processes in bivalves: a mechanistic approach}, ' ...
'journal = {Ecological Modelling}, ' ...
'volume = {222}, ' ...
'pages = {514-523}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaraMeer2011'; type = 'Article'; bib = [ ... 
'author = {Saraiva, S. and van der Meer, J. and Kooijman, S. A. L. M. and Sousa, T.}, ' ... 
'year = {2011}, ' ...
'title = {{D}{E}{B} parameter estimation for \emph{Mytilus edulis}}, ' ...
'journal = {J. Sea Res.}, ' ...
'volume = {66}, ' ...
'pages = {289--296}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SaraMeer2012'; type = 'Article'; bib = [ ... 
'author = {Saraiva, S. and Meer, J. van der and Kooijman, S. A. L. M. and Witbaard, R. and Philippart, C. J. M. and Hippler, D. and Parker, R.}, ' ... 
'year = {2012}, ' ...
'title = {Validating a {D}{E}{B} model for a blue mussel}, ' ...
'journal = {MEPS}, ' ...
'volume = {463}, ' ...
'pages = {141--158}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'RodhRode1984'; type = 'Article'; bib = [ ... 
'author = {Rodhouse, P. and Roden, C. and Burnell, G. and Hensey, M. and McMahon, T. and Ottway, B. and Ryan, T.}, ' ... 
'year = {1984}, ' ...
'title = {Food resource, gametogenesis and growth of \emph{Mytilus edulis} on the shore and in suspended culture: {K}illary {H}arbour, {I}reland}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {64}, ' ...
'pages = {513-529}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WiddFiet1979'; type = 'Article'; bib = [ ... 
'author = {Widdows, J. and Fieth, P. and Worral, C.}, ' ... 
'year = {1979}, ' ...
'title = {Relationship between seston, available food and feeding activity in the common mussel \emph{Mytilus edulis}}, ' ...
'journal = {Mar. Biol.}, ' ...
'volume = {50}, ' ...
'pages = {195-207}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KiorMohl1980'; type = 'Article'; bib = [ ... 
'author = {Ki{\o}rboe, T. and M{\o}hlenberg, F. and N{\o}hr, O.}, ' ... 
'year = {1980}, ' ...
'title = {Feeding, particle selection and carbon absorption in \emph{Mytilus edulis} in different mixtures of algae and resuspended bottom material}, ' ...
'journal = {Ophelia}, ' ...
'volume = {19}, ' ...
'pages = {193-205}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PrinSmaa1991'; type = 'Article'; bib = [ ... 
'author = {Prins, T. and Smaal, A. and Pouwer, A.}, ' ... 
'year = {1991}, ' ...
'title = {Selective ingestion of phytoplankton by the bivalves \emph{Mytilus edulis} {L}. and \emph{Cerastoderma edule} ({L}.)}, ' ...
'journal = {Hydrobiol. Bull.}, ' ...
'volume = {25}, ' ...
'pages = {93-100}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Krug1960'; type = 'Article'; bib = [ ... 
'author = {Kruger, F.}, ' ... 
'year = {1960}, ' ...
'title = {Zur {F}rage der {G}rossenabhangigkeit des {S}auerstoffverbrauchs von \emph{Mytilus edulis} {L}.}, ' ...
'journal = {Helgol. wiss. Meeresunters}, ' ...
'volume = {7}, ' ...
'pages = {125-148}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Borc1985'; type = 'Article'; bib = [ ... 
'author = {Borchardt, T.}, ' ... 
'year = {1985}, ' ...
'title = {Relationships between carbon and cadmium uptake in \emph{Mytilus edulis}}, ' ...
'journal = {Marine Biology}, ' ...
'volume = {85}, ' ...
'pages = {233-244}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PietKluy1979'; type = 'Incollection'; bib = [ ... 
'author = {Pieters, H. and Kluytmans, J. and Zurburg, W. and Zandee, D.}, ' ... 
'year = {1979}, ' ...
'title = {The influence of seasonal changes on energy metabolism in \emph{Mytilus edulis} ({L}.). i. growth rate and biochemical composition in relation to environmental parameters and spawning fed on different algal diets}, ' ...
'booktitle = {Cyclic phenomena in marine plants and animals}, ' ...
'editor = {Naylor, E. and Hartnoll, R.}, ' ...
'publisher = {Pergamon Press}, '...
'address = {New York}, '...
'pages = {285-292}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'StroCary1984'; type = 'Article'; bib = [ ... 
'author = {Str\"{o}mgren, T. and Cary, C.}, ' ... 
'year = {1984}, ' ...
'title = {Growth in length of \e,ph{Mytilus edulis} {L}. fed on different algal diets}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {76}, ' ...
'pages = {23--24}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BaynHawk1987'; type = 'Article'; bib = [ ... 
'author = {Bayne, B. and Hawkins, A. and Navarro, E.}, ' ... 
'year = {1987}, ' ...
'title = {Feeding and digestion by the mussel \emph{Mytilus edulis} {L}. ({B}ivalvia: {M}ollusca) in mixtures of silt and algal cells at low concentrations}, ' ...
'journal = {J. Exp. Mar. Biol. Ecol.}, ' ...
'volume = {111}, ' ...
'pages = {1--22}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BaynHawk1989'; type = 'Article'; bib = [ ... 
'author = {Bayne, B. and Hawkins, J. and Navarro, E. and Iglesias, I.}, ' ... 
'year = {1989}, ' ...
'title = {Effects of seston concentration on feeding, digestion and growth in the mussel \emph{Mytilus edulis}}, ' ...
'journal = {Mar. Ecol. Prog. Ser.}, ' ...
'volume = {55}, ' ...
'pages = {47-54}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sara2014'; type = 'PhDthesis'; bib = [ ... 
'author = {Saraiva, S.}, ' ... 
'year = {2014}, ' ...
'title = {Modelling bivalves in estuaries and coastal areas} , ' ...
'school = {VU University Amsterdam and Lisbon University}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'HonkMeer1998'; type = 'Article'; bib = [ ... 
'author = {Honkoop, P. J. C. and Van der Meer, J.}, ' ... 
'year = {1998}, ' ...
'title = {Experimentally induced effects of water temperature and immersion time on reproductive output of bivalves in the {W}adden {S}ea}, ' ...
'journal = {Journal of Experimental Marine Biology and Ecology}, ' ...
'volume = {220}, ' ...
'pages = {227--246}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

